import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_appraisal/core/config.dart';
import 'package:mobile_appraisal/core/constants/colors.dart';
import 'package:skeletons/skeletons.dart';
import 'package:uuid/uuid.dart';

class QListView extends StatefulWidget {
  static Map<String, QListViewState> instance = {};
  final String? id;
  final Function(int page, int limit, String search) futureBuilder;
  final double? height;
  final double? padding;
  final Gradient? gradient;
  final Color? color;
  final Axis? scrollDirection;
  final bool wrapMode;
  final bool shrinkWrap;
  final double? bottomMargin;

  static reloadAll() async {
    for (var key in instance.keys) {
      instance[key]?.reload();
    }
  }

  final Function(int, Map) builder;
  const QListView({
    this.id,
    required this.builder,
    required this.futureBuilder,
    this.height,
    this.padding,
    this.gradient,
    this.color,
    this.scrollDirection,
    this.wrapMode = false,
    this.shrinkWrap = false,
    this.bottomMargin,
    super.key,
  });

  @override
  State<QListView> createState() => QListViewState();
}

class QListViewState extends State<QListView> {
  bool loading = true;
  bool bottomLoading = false;
  Response? response;
  DioException? dioError;
  List<Map?> items = [];
  int page = 0;
  int limit = 10;
  String search = '';
  ScrollController scrollController = ScrollController();

  // bool singleModeLoading = false;

  Future onLoading({
    bool nextPage = false,
  }) async {
    if (!mounted) return;

    if (!nextPage) {
      page = 0;
      limit = 10;
      items.clear();
      loading = true;
      setState(() {});
    } else {
      page = page + 10;
    }

    dioError = null;

    try {
      response = await widget.futureBuilder(page, limit, search);
    } on DioException catch (e) {
      dioError = e;
      debugPrint("DioError: $e");
    } on Exception catch (e) {
      debugPrint("Exception: $e");
    }

    if (dioError != null || response == null) {
      loading = false;
      if (mounted) setState(() {});
      return;
    }

    Map responseMap2 = response?.data;

    List data = responseMap2["products"];

    if (data.isNotEmpty) {
      if (responseMap2['skip'] == responseMap2['total']) {
        onLoading(nextPage: false);
      }

      if (data.isEmpty) {
        loading = false;
        if (mounted) setState(() {});
        return;
      } else {
        for (var i = 0; i < data.length; i++) {
          var item = data[i];
          items.add(item);
        }
      }
      loading = false;
      if (mounted) {
        setState(() {});
      }
    } else {
      loading = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  initScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        onLoading(nextPage: true);
      }
    });
  }

  late String id;

  @override
  void initState() {
    super.initState();
    id = widget.id ?? const Uuid().v4();
    QListView.instance[id] = this;
    initScrollController();
    onLoading();
  }

  @override
  void dispose() {
    super.dispose();
    QListView.instance.remove(id);
  }

  reload() async {
    if (mounted) {
      await onLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return ListView.builder(
        itemCount: 6,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const Card(
            child: ListTile(
              leading: SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    shape: BoxShape.circle, width: 70, height: 70),
              ),
              title: SkeletonLine(
                style: SkeletonLineStyle(
                  padding: EdgeInsets.only(bottom: 5),
                ),
              ),
              subtitle: SkeletonLine(),
            ),
          );
        },
      );
    }
    if (widget.wrapMode) {
      return Wrap(
        children: List.generate(
          items.length,
          (index) {
            var item = (items[index] as Map);
            return widget.builder(index, item);
          },
        ),
      );
    }

    if (dioError != null) {
      return SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oopps..No Connection Internet \n ${dioError?.message}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  )),
              onPressed: () {
                onLoading();
              },
            ),
          ],
        ),
      );
    }

    if (response == null) {
      return SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Null response : ${response?.statusCode}",
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text(
                "Refresh",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                onLoading();
              },
            ),
          ],
        ),
      );
    }

    if (items.isNotEmpty) {
      return Container(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(widget.padding ?? 0.0),
        decoration: BoxDecoration(
          color: widget.color,
          gradient: widget.gradient,
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            await reload();
          },
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: ListView.builder(
              controller: scrollController,
              itemCount: items.length,
              shrinkWrap: widget.shrinkWrap,
              scrollDirection: widget.scrollDirection ?? Axis.vertical,
              itemBuilder: (context, index) {
                Map item = (items[index] as Map);

                return Container(
                  margin: EdgeInsets.only(
                    bottom: widget.bottomMargin ?? 0.0,
                  ),
                  child: widget.builder(index, item),
                );
              },
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(widget.padding ?? 0.0),
        decoration: BoxDecoration(
          color: widget.color,
          gradient: widget.gradient,
        ),
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async {
            await reload();
          },
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: Center(
              child: Image.asset(
                AppConfig.imgEmptyDataNull,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
                semanticLabel: "Order List Masih Kosong",
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      );
    }
  }
}
