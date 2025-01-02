import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_appraisal/core/assets/assets.gen.dart';
import 'package:mobile_appraisal/core/components/custom_paint.dart';
import 'package:mobile_appraisal/core/components/spaces.dart';
import 'package:mobile_appraisal/core/config.dart';
import 'package:mobile_appraisal/data/models/request/job/job_list_request_model.dart';
import 'package:mobile_appraisal/presentation/job/bloc/job_list_progres/job_lis_progres_bloc.dart';
import 'package:skeletons/skeletons.dart';

import '../../../core/constants/colors.dart';

class InspectionListPage extends StatefulWidget {
  const InspectionListPage({super.key});

  @override
  State<InspectionListPage> createState() => _InspectionListPageState();
}

class _InspectionListPageState extends State<InspectionListPage> {
  final TextEditingController _querySearchinspectionlist =
      TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isTextNotEmpty = false;
  bool _isLoading = true;
  Timer? _debounce;

  clearSearchinspectionlist() {
    setState(() {
      _isTextNotEmpty = _querySearchinspectionlist.text.isNotEmpty;
    });
  }

  Future<void> _getListdataInspection() async {
    final paramsJoblistrequest = JobListRequest(
        page: 1,
        limit: 100,
        flagpetugas: 1,
        status: 2,
        uker: '',
        q: _querySearchinspectionlist.text);

    if (mounted) {
      context.read<JobLisProgresBloc>().add(
          JobLisProgresEvent.getJobList(joblistrequest: paramsJoblistrequest));
    }
  }

  void _searchParam() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: AppConfig.debouce), () {
      _getListdataInspection();
    });
  }

  @override
  void initState() {
    _querySearchinspectionlist.addListener(clearSearchinspectionlist);
    super.initState();
  }

  @override
  void dispose() {
    _querySearchinspectionlist.dispose();
    _debounce?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getListdataInspection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Untuk menghindari overlay keyboard
      body: CustomScrollView(
        slivers: [
          // SliverAppBar dengan efek melengkung
          SliverAppBar(
            scrolledUnderElevation: 100,
            collapsedHeight: 150,
            expandedHeight: 200, // Atur tinggi AppBar sesuai keinginan
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            automaticallyImplyLeading: false, // Menonaktifkan icon back default
            flexibleSpace: ClipPath(
              clipper:
                  ClipPathClass(), // Custom clip untuk bagian bawah yang melengkung
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: AppColors.primary, // Warna latar belakang AppBar
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () =>
                                _isLoading ? false : Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_circle_left,
                              size: 40.0,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Inspection List",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppSizeFont.xl,
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(20),
                      // TextField tetap berada di bawah app bar
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          focusNode: _focusNode,
                          autofocus: false,
                          controller: _querySearchinspectionlist,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              top: 2.0,
                              bottom: 2.0,
                            ),
                            filled: true,
                            hoverColor: AppColors.secondary,
                            fillColor: Colors.grey[100],
                            hintText: "Ketik No Aplikasi / Nama..",
                            suffixIcon: _isTextNotEmpty
                                ? InkWell(
                                    hoverColor: Colors.red,
                                    child: Icon(
                                      Icons.clear_rounded,
                                      color: Colors.grey[600],
                                    ),
                                    onTap: () async {
                                      _querySearchinspectionlist.clear();
                                      _getListdataInspection();
                                    },
                                  )
                                : null,
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                                width: 1.0,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: AppColors.primary,
                            ),
                          ),
                          onEditingComplete: () {
                            _getListdataInspection();
                          },
                          onChanged: (value) {
                            _searchParam();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floating: true, // AppBar menghilang saat scroll ke atas
            snap: true, // AppBar muncul kembali saat scroll ke bawah
            pinned: true, // AppBar tidak selalu tetap
          ),

          BlocConsumer<JobLisProgresBloc, JobLisProgresState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  success: (result) {
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  error: (message) {
                    setState(() {
                      _isLoading = false;
                    });

                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Error',
                        message: message,
                        contentType: ContentType.warning,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(blurRadius: 4, color: Colors.black12)
                              ],
                            ),
                            child: Row(
                              children: [
                                const SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    width: 50,
                                    height: 50,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          height: 16,
                                          width: double.infinity,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          height: 16,
                                          width: 100,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 7,
                    ),
                  );
                },
                error: (error) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 8.0, right: 8.0),
                          child: Center(
                            // Memastikan isi berada di tengah
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.images.notFound.path,
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  );
                },
                loading: () {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(blurRadius: 4, color: Colors.black12)
                              ],
                            ),
                            child: Row(
                              children: [
                                const SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    width: 50,
                                    height: 50,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          height: 16,
                                          width: double.infinity,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          height: 16,
                                          width: 100,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 7,
                    ),
                  );
                },
                success: (result) {
                  if (result.data.isNotEmpty) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final ammountData = result.data[index].orderAmount;
                          final parsedDate = result.data[index].orderDate;
                          final formattedDate =
                              DateFormat('dd-MM-yyyy HH:mm').format(parsedDate);
                          return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  left: 300,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Opacity(
                                      opacity: 0.15,
                                      child: Image.asset(
                                        Assets.images.bgCard.path,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Stack(
                                      children: [
                                        // Background image
                                        // Card content
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6),
                                              decoration: BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                result.data[index]
                                                    .orderjenisObjek.detailName,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            const SpaceHeight(4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  result.data[index].orderName
                                                              .length >
                                                          60
                                                      ? '${result.data[index].orderName.substring(0, 60)}...'
                                                      : result.data[index]
                                                          .orderName,
                                                  style: const TextStyle(
                                                    fontSize: AppSizeFont.lg,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  result.data[index].orderType,
                                                  style: const TextStyle(
                                                    fontSize: AppSizeFont.sm,
                                                    color: AppColors.greydark,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SpaceHeight(4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .surround_sound_rounded,
                                                      color: AppColors.greydark,
                                                      size: AppSizeFont.sm,
                                                    ),
                                                    const SpaceWidth(2),
                                                    Text(
                                                      result.data[index]
                                                          .orderSource,
                                                      style: const TextStyle(
                                                        fontSize:
                                                            AppSizeFont.sm,
                                                        color:
                                                            AppColors.greydark,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  result.data[index].orderNo
                                                      .replaceAll(' ', ''),
                                                  style: const TextStyle(
                                                    fontSize: AppSizeFont.sm,
                                                    color: AppColors.greydark,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    const Icon(
                                                      Icons.home_work_rounded,
                                                      color: AppColors.greydark,
                                                      size: AppSizeFont.sm,
                                                    ),
                                                    const SpaceWidth(2),
                                                    Text(
                                                      result
                                                                  .data[index]
                                                                  .orderBranchName
                                                                  .length >
                                                              60
                                                          ? '${result.data[index].orderBranchName.substring(0, 60)}...'
                                                          : result.data[index]
                                                              .orderBranchName,
                                                      style: const TextStyle(
                                                        fontSize:
                                                            AppSizeFont.sm,
                                                        color:
                                                            AppColors.greydark,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  result
                                                      .data[index].orderSegmen,
                                                  style: const TextStyle(
                                                    fontSize: AppSizeFont.sm,
                                                    color: AppColors.greydark,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SpaceHeight(4),
                                            const DashedLine(
                                              direction: Axis.horizontal,
                                              dashWidth: 5,
                                              dashHeight: 2,
                                              dashSpacing: 4,
                                              color: AppColors.greydark,
                                            ),
                                            const SpaceHeight(4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.calendar_month,
                                                      color: AppColors.greydark,
                                                      size: AppSizeFont.sm,
                                                    ),
                                                    const SpaceWidth(2),
                                                    Text(
                                                      formattedDate,
                                                      style: const TextStyle(
                                                        fontSize:
                                                            AppSizeFont.sm,
                                                        color:
                                                            AppColors.greydark,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'IDR ${NumberFormat('#,###').format(int.parse(ammountData))}',
                                                  style: const TextStyle(
                                                    fontSize: AppSizeFont.sm,
                                                    color: AppColors.greydark,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              // Aksi untuk titik-titik
                                            },
                                            child: const Icon(
                                              Icons.arrow_circle_right_rounded,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: result.countData ?? result.data.length,
                      ),
                    );
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 50.0, left: 8.0, right: 8.0),
                            child: Center(
                              // Memastikan isi berada di tengah
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.images.notFound.path,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                  ),
                                  const SpaceHeight(0.2), // Jarak bawah
                                  const Text(
                                    'Inspection tidak Tersedia',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20); // Memperbaiki posisi lengkungan
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 20); // Menyesuaikan lengkungan
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
