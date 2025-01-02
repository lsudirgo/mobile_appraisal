import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';
import 'package:mobile_appraisal/presentation/dashboard/bloc/dashboard_done/dashboard_done_bloc.dart';
import 'package:mobile_appraisal/presentation/dashboard/bloc/dashboard_progress/dashboard_progress_bloc.dart';
import 'package:mobile_appraisal/presentation/dashboard/pages/notification_page.dart';
import 'package:skeletons/skeletons.dart';

import '../../../core/core.dart';
import '../bloc/dashboard_pending/dashboard_pending_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isLoadingProfile = true;
  bool _isloadingReportYear = true;
  bool _isSelectedYear = true;
  bool _isloadingReportPending = true;
  bool _isloadingReportProgress = true;
  String? _namemain = '';
  String? _unitkerja = '';
  String? _gendermain = '';
  int? selectedYearDasboard = DateTime.now().year;
  int _taksasiCount = 0;
  int _retaksasiCount = 0;
  int _reviewCount = 0;
  int _pendingCount = 0;
  var _itemStatus = [];

  void playLoadingProfile() async {
    setState(() {
      _isLoadingProfile = true;
    });

    final authData = await AuthLocalDatasource().getAuthData();
    final data = authData?.result?.detailData;
    if (data != null) {
      setState(() {
        _namemain = data.name;
        _unitkerja = data.fou;
        _gendermain = data.gender;
        _isLoadingProfile = false;
      });
    }
  }

  void _getDashboardReportdone() {
    String yearSelectedconvert = selectedYearDasboard.toString();
    if (yearSelectedconvert.isNotEmpty) {
      if (mounted) {
        context
            .read<DashboardDoneBloc>()
            .add(DashboardDoneEvent.getDashboardDone(yearSelectedconvert));

        setState(() {
          _isloadingReportYear = false;
        });
      }
    }
  }

  void _getDashboardPending() {
    if (mounted) {
      context
          .read<DashboardPendingBloc>()
          .add(const DashboardPendingEvent.getDashboardPending());
      setState(() {
        _isloadingReportPending = false;
      });
      _getDashboardProgress();
    }
  }

  void _getDashboardProgress() {
    if (mounted) {
      context
          .read<DashboardProgressBloc>()
          .add(const DashboardProgressEvent.getDashboardProgress());
      setState(() {
        _isloadingReportProgress = false;
      });
    }
  }

  Future<void> _refreshData() async {
    _getDashboardPending();
    _getDashboardReportdone();
    playLoadingProfile();
  }

  @override
  void initState() {
    _getDashboardPending();
    _getDashboardReportdone();
    // playLoading();
    playLoadingProfile();
    super.initState();
  }

  @override
  void dispose() {
    // playLoading();
    playLoadingProfile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imagePathMain = _gendermain == 'Laki - laki'
        ? Assets.images.iconsProfileMan.path
        : Assets.images.iconsProfileGirl.path;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: ClipPathClass(),
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: _isLoadingProfile
                                                  ? const SkeletonAvatar(
                                                      style: SkeletonAvatarStyle(
                                                          width: 50,
                                                          height: 50,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          100))),
                                                    )
                                                  : Image.asset(
                                                      imagePathMain,
                                                      width: 50,
                                                      height: 50,
                                                    ),
                                            ),
                                          ),
                                          const SpaceWidth(5),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: _isLoadingProfile
                                                ? const SkeletonLine(
                                                    style: SkeletonLineStyle(
                                                      height: 20,
                                                    ),
                                                  )
                                                : Text(
                                                    _namemain!,
                                                    style: const TextStyle(
                                                      fontSize: AppSizeFont.xl,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                          )
                                        ]),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () =>
                                    {context.push(const NotificationPage())},
                                child: const Badge(
                                  backgroundColor: AppColors.secondary,
                                  alignment: AlignmentDirectional.topEnd,
                                  largeSize: 20,
                                  label: Text(
                                    "4",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: AppSizeFont.md,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.notifications,
                                    color: AppColors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _isLoadingProfile
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          height: 20,
                                          width: 100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.home_work_rounded,
                                        size: AppSizeFont.xxl,
                                        color: AppColors.light,
                                      ),
                                      const SpaceWidth(5),
                                      Text(
                                        _unitkerja!,
                                        style: const TextStyle(
                                          fontSize: AppSizeFont.lg,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 4.5,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.white.withValues(alpha: 0.6),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(0,
                                          3), // arah bayangan pada sumbu x dan y
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const SpaceHeight(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: BlocConsumer<DashboardPendingBloc,
                                          DashboardPendingState>(
                                        listener: (context, state) {
                                          state.maybeWhen(
                                            success: (resultpendingData) {
                                              final resultResponse =
                                                  resultpendingData.result;
                                              _pendingCount = resultResponse;

                                              setState(() {
                                                _isloadingReportPending = false;
                                              });
                                            },
                                            error: (error) {
                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  title: 'Error',
                                                  message: error,
                                                  contentType:
                                                      ContentType.warning,
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);
                                              setState(() {
                                                _isloadingReportPending = false;
                                              });
                                            },
                                            orElse: () {
                                              _isloadingReportPending = true;
                                            },
                                          );
                                        },
                                        builder: (context, state) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              _isloadingReportPending
                                                  ? const SkeletonLine(
                                                      style: SkeletonLineStyle(
                                                        height: 30,
                                                        width: 40,
                                                      ),
                                                    )
                                                  : Text(
                                                      _pendingCount.toString(),
                                                      style: const TextStyle(
                                                        fontSize:
                                                            AppSizeFont.xxl,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                              const Text(
                                                "Pending Order",
                                                style: TextStyle(
                                                  fontSize: AppSizeFont.xl,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _isloadingReportPending ||
                                                          _isloadingReportProgress
                                                      ? null
                                                      : _getDashboardPending();
                                                },
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors
                                                          .transparent, // Border color
                                                      width:
                                                          2.0, // Border width
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0), // Optional: Rounded corners
                                                  ),
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(
                                                        5.0), // Optional: Add some padding around the icon
                                                    child: Icon(
                                                      Icons.refresh_rounded,
                                                      size: AppSizeFont.xxl,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),

                                    // tambahkan custom carousel disini
                                    const SpaceHeight(5),
                                    Expanded(
                                      child: SizedBox.expand(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              BlocConsumer<
                                                  DashboardProgressBloc,
                                                  DashboardProgressState>(
                                                listener: (context, state) {
                                                  state.maybeWhen(
                                                    success:
                                                        (resultprogressData) {
                                                      final statusMap = {
                                                        10: {
                                                          'icon':
                                                              Assets.icons.done
                                                        },
                                                        2: {
                                                          'icon': Assets.icons
                                                              .notificationRounded
                                                        },
                                                        1: {
                                                          'icon': Assets
                                                              .icons.connect
                                                        },
                                                        3: {
                                                          'icon':
                                                              Assets.icons.done
                                                        },
                                                        5: {
                                                          'icon':
                                                              Assets.icons.done
                                                        },
                                                        6: {
                                                          'icon': Assets
                                                              .icons.support
                                                        },
                                                      };
                                                      _itemStatus =
                                                          resultprogressData
                                                              .result
                                                              .map((item) {
                                                        int statusNo =
                                                            int.parse(
                                                                item.statusNo);
                                                        final iconStatus =
                                                            statusMap[statusNo];
                                                        final statusData =
                                                            item.statusName;
                                                        final countData =
                                                            item.countData;
                                                        return {
                                                          'status': statusData,
                                                          'icon': iconStatus?[
                                                              'icon'],
                                                          'value': countData,
                                                        };
                                                      }).toList();

                                                      setState(() {
                                                        _isloadingReportProgress =
                                                            false;
                                                      });
                                                    },
                                                    error: (error) {
                                                      final snackBar = SnackBar(
                                                        elevation: 0,
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        content:
                                                            AwesomeSnackbarContent(
                                                          title: 'Error',
                                                          message: error,
                                                          contentType:
                                                              ContentType
                                                                  .warning,
                                                        ),
                                                      );

                                                      ScaffoldMessenger.of(
                                                          context)
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(
                                                            snackBar);
                                                      setState(() {
                                                        _isloadingReportProgress =
                                                            false;
                                                      });
                                                    },
                                                    orElse: () {
                                                      _isloadingReportProgress =
                                                          true;
                                                    },
                                                  );
                                                },
                                                builder: (context, state) {
                                                  return _isloadingReportProgress
                                                      ? Container(
                                                          height: 100,
                                                          width: 300,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                          child:
                                                              const SkeletonItem(
                                                                  child:
                                                                      Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Column(
                                                              children: [
                                                                SkeletonLine(
                                                                  style:
                                                                      SkeletonLineStyle(
                                                                    width: 150,
                                                                  ),
                                                                ),
                                                                SpaceHeight(5),
                                                                SkeletonLine(),
                                                                SpaceHeight(5),
                                                                SkeletonLine(
                                                                  style:
                                                                      SkeletonLineStyle(
                                                                    height: 35,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                        )
                                                      : SizedBox(
                                                          height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              1.3,
                                                          child:
                                                              PageView.builder(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                _itemStatus
                                                                    .length,
                                                            itemBuilder:
                                                                (items, index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        1.0),
                                                                child: Animate(
                                                                  effects: const [
                                                                    FadeEffect(),
                                                                    ScaleEffect(),
                                                                  ],
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        height: MediaQuery.of(context)
                                                                            .size
                                                                            .height,
                                                                        width: MediaQuery.of(context).size.width /
                                                                            1.4,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                                gradient: LinearGradient(colors: [
                                                                                  AppColors.light,
                                                                                  AppColors.white
                                                                                ], transform: GradientRotation(50)),
                                                                                border: BorderDirectional(top: BorderSide(color: AppColors.white, width: 1), bottom: BorderSide(color: AppColors.white, width: 1)),
                                                                                color: AppColors.secondary,
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(30),
                                                                                  bottomLeft: Radius.circular(30),
                                                                                  topRight: Radius.circular(5),
                                                                                  bottomRight: Radius.circular(5),
                                                                                ),
                                                                                shape: BoxShape.rectangle),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                                              decoration: BoxDecoration(
                                                                                color: AppColors.primary,
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              child: Text(
                                                                                '${_itemStatus[index]['value']}',
                                                                                style: const TextStyle(color: Colors.white, fontSize: 14),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.only(left: 70),
                                                                              width: MediaQuery.of(context).size.width / 2.5,
                                                                              child: Center(
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  children: [
                                                                                    Text(
                                                                                      _itemStatus[index]['status'] as String,
                                                                                      style: const TextStyle(fontSize: AppSizeFont.lg, fontWeight: FontWeight.bold, color: AppColors.grey),
                                                                                    ),
                                                                                    SvgPicture.asset(
                                                                                      _itemStatus[index]['icon'] as String,
                                                                                      fit: BoxFit.fitHeight,
                                                                                      height: 70,
                                                                                      width: 70,
                                                                                      colorFilter: const ColorFilter.mode(
                                                                                        AppColors.primary,
                                                                                        BlendMode.srcIn,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        children:
                                                                            List.generate(
                                                                          _itemStatus
                                                                              .length,
                                                                          (indexDots) {
                                                                            return Container(
                                                                              margin: const EdgeInsets.only(bottom: 2),
                                                                              width: 8,
                                                                              height: index == indexDots ? 30 : 8,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: index == indexDots ? AppColors.light : AppColors.hover, border: Border.all(color: AppColors.primary)),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // tambahkan custom carousel disini
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: SizedBox(
                                    height: 50.0,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Annual Report $selectedYearDasboard',
                                          style: const TextStyle(
                                            fontSize: AppSizeFont.lg,
                                            color: AppColors.greydark,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            final currentYear =
                                                DateTime.now().year;
                                            final years = List.generate(6,
                                                (index) => currentYear - index);

                                            _isloadingReportYear
                                                ? null
                                                : showBottomDialog(
                                                    context: context,
                                                    heightFactor: 0.3,
                                                    paddingTop: 2,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          const Text(
                                                            'Pilih Tahun Report',
                                                            style: TextStyle(
                                                              fontSize:
                                                                  AppSizeFont
                                                                      .lg,
                                                              color: AppColors
                                                                  .greydark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 8.0),
                                                          Expanded(
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  years.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                final year =
                                                                    years[
                                                                        index];
                                                                _isSelectedYear =
                                                                    year ==
                                                                        selectedYearDasboard;

                                                                return Container(
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          4.0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: _isSelectedYear
                                                                        ? AppColors
                                                                            .secondary
                                                                        : Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: _isSelectedYear
                                                                          ? AppColors
                                                                              .secondary
                                                                          : AppColors
                                                                              .grey,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      ListTile(
                                                                    title:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        year.toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color: _isSelectedYear
                                                                              ? AppColors.white
                                                                              : AppColors.greydark,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        selectedYearDasboard =
                                                                            year;
                                                                      });
                                                                      _getDashboardReportdone();
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                          },
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors
                                                    .grey, // Border color
                                                width: 2.0, // Border width
                                              ),
                                              borderRadius: BorderRadius.circular(
                                                  8.0), // Optional: Rounded corners
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(
                                                  8.0), // Optional: Add some padding around the icon
                                              child: Icon(
                                                Icons.filter_list,
                                                size: AppSizeFont.xxl,
                                                color: AppColors.greydark,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                BlocConsumer<DashboardDoneBloc,
                                    DashboardDoneState>(
                                  listener: (context, state) {
                                    state.maybeWhen(
                                      success: (resultData) {
                                        final resultResponse =
                                            resultData.result;
                                        var retaksasiItem =
                                            resultResponse.firstWhere((item) =>
                                                item.statusName == 'Retaksasi');
                                        var taksasiItem =
                                            resultResponse.firstWhere((item) =>
                                                item.statusName == 'Taksasi');
                                        var reviewiItem =
                                            resultResponse.firstWhere((item) =>
                                                item.statusName == 'Review');

                                        _retaksasiCount =
                                            retaksasiItem.countData ?? 0;
                                        _taksasiCount =
                                            taksasiItem.countData ?? 0;
                                        _reviewCount =
                                            reviewiItem.countData ?? 0;
                                        setState(() {
                                          _isloadingReportYear = false;
                                        });
                                      },
                                      error: (error) {
                                        // final resultResponse = error;

                                        final snackBar = SnackBar(
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: 'Error',
                                            message: error,
                                            contentType: ContentType.warning,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);
                                        setState(() {
                                          _isloadingReportYear = false;
                                        });
                                      },
                                      orElse: () {
                                        _isloadingReportYear = true;
                                      },
                                    );
                                  },
                                  builder: (context, state) {
                                    return Card(
                                      shadowColor: AppColors.primary,
                                      child: Container(
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white
                                                  .withValues(alpha: 0.5),
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              offset: const Offset(0,
                                                  3), // arah bayangan pada sumbu x dan y
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipPath(
                                              clipper: ClipPathClassCard(),
                                              child: Container(
                                                alignment: Alignment.topLeft,
                                                height: 100,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                decoration: const BoxDecoration(
                                                  color: AppColors.primary,
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Taksasi",
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.all(8),
                                              height: 100,
                                              width: 100,
                                              padding: const EdgeInsets.only(
                                                  top: 25),
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: _isloadingReportYear
                                                  ? const SkeletonLine(
                                                      style: SkeletonLineStyle(
                                                          height: 20,
                                                          width: 100,
                                                          alignment: Alignment
                                                              .centerRight),
                                                    )
                                                  : Text(
                                                      NumberFormat('#,###')
                                                          .format(
                                                              _taksasiCount),
                                                      style: const TextStyle(
                                                        fontSize: 25.0,
                                                        color:
                                                            AppColors.primary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Card(
                                  shadowColor: AppColors.primary,
                                  child: Container(
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white
                                              .withValues(alpha: 0.5),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: const Offset(0,
                                              3), // arah bayangan pada sumbu x dan y
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipPath(
                                          clipper: ClipPathClassCard(),
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            height: 100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: const BoxDecoration(
                                              color: AppColors.secondary,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                "Retaksasi",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          height: 100,
                                          width: 100,
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: _isloadingReportYear
                                              ? const SkeletonLine(
                                                  style: SkeletonLineStyle(
                                                      height: 20,
                                                      width: 100,
                                                      alignment: Alignment
                                                          .centerRight),
                                                )
                                              : Text(
                                                  NumberFormat('#,###')
                                                      .format(_retaksasiCount),
                                                  style: const TextStyle(
                                                    fontSize: 25.0,
                                                    color: AppColors.secondary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  shadowColor: AppColors.primary,
                                  child: Container(
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white
                                              .withValues(alpha: 0.5),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: const Offset(0,
                                              3), // arah bayangan pada sumbu x dan y
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipPath(
                                          clipper: ClipPathClassCard(),
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            height: 100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: const BoxDecoration(
                                              color: AppColors.primary,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                "Review KJPP",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          height: 100,
                                          width: 100,
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: _isloadingReportYear
                                              ? const SkeletonLine(
                                                  style: SkeletonLineStyle(
                                                      height: 20,
                                                      width: 100,
                                                      alignment: Alignment
                                                          .centerRight),
                                                )
                                              : Text(
                                                  NumberFormat('#,###')
                                                      .format(_reviewCount),
                                                  style: const TextStyle(
                                                    fontSize: 25.0,
                                                    color: AppColors.primary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
