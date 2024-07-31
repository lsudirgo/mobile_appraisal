import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';
import 'package:mobile_appraisal/presentation/dashboard/pages/notification_page.dart';
import 'package:skeletons/skeletons.dart';

import '../../../core/core.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isLoading = true;
  bool isLoadingProfile = true;
  String? _namemain = '';
  String? _unitkerja = '';
  String? _gendermain = '';

  void playLoading() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void playLoadingProfile() async {
    setState(() {
      isLoadingProfile = true;
    });

    final authData = await AuthLocalDatasource().getAuthData();
    final data = authData?.result?.detailData;
    if (data != null) {
      setState(() {
        _namemain = data.name;
        _unitkerja = data.fou;
        _gendermain = data.gender;
        isLoadingProfile = false;
      });
    }
  }

  final itemStatus = [
    {'status': 'Disposisi', 'icon': Assets.icons.attendance, 'value': 10},
    {'status': 'On Progress', 'icon': Assets.icons.image, 'value': 5},
    {'status': 'Reviewer', 'icon': Assets.icons.email, 'value': 3},
    {'status': 'Approval', 'icon': Assets.icons.attendance, 'value': 244},
    {'status': 'Back', 'icon': Assets.icons.reverse, 'value': 1},
  ];

  @override
  void initState() {
    playLoading();
    playLoadingProfile();
    super.initState();
  }

  @override
  void dispose() {
    playLoading();
    playLoadingProfile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imagePathMain = _gendermain == 'Laki - laki'
        ? Assets.images.iconsProfileMan.path
        : Assets.images.iconsProfileGirl.path;
    return Scaffold(
      body: SingleChildScrollView(
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
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: isLoadingProfile
                                                ? const SkeletonAvatar(
                                                    style: SkeletonAvatarStyle(
                                                        width: 50,
                                                        height: 50,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
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
                                          child: isLoadingProfile
                                              ? const SkeletonLine(
                                                  style: SkeletonLineStyle(
                                                    height: 20,
                                                  ),
                                                )
                                              : Text(
                                                  _namemain!,
                                                  style: const TextStyle(
                                                    fontSize: AppSizeFont.xl,
                                                    fontWeight: FontWeight.bold,
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
                      isLoadingProfile
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
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: const Offset(0,
                                        3), // arah bayangan pada sumbu x dan y
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SpaceHeight(5),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Pending Order",
                                          style: TextStyle(
                                            fontSize: AppSizeFont.lg,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.pending_actions,
                                          size: 22.0,
                                          color: AppColors.light,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SpaceHeight(5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Row(
                                      children: [
                                        const SpaceWidth(5),
                                        isLoading
                                            ? const SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  height: 20,
                                                  width: 100,
                                                ),
                                              )
                                            : const Text(
                                                "10",
                                                style: TextStyle(
                                                  fontSize: AppSizeFont.xxl,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
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
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.3,
                                              child: PageView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: itemStatus.length,
                                                itemBuilder: (items, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
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
                                                            height:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.4,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    gradient: LinearGradient(
                                                                        colors: [
                                                                          AppColors
                                                                              .background,
                                                                          AppColors
                                                                              .blueLight
                                                                        ],
                                                                        transform:
                                                                            GradientRotation(
                                                                                50)),
                                                                    border: BorderDirectional(
                                                                        top: BorderSide(
                                                                            color: AppColors
                                                                                .white,
                                                                            width:
                                                                                1),
                                                                        bottom: BorderSide(
                                                                            color: AppColors
                                                                                .white,
                                                                            width:
                                                                                1)),
                                                                    color: AppColors
                                                                        .secondary,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              30),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              30),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              5),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              5),
                                                                    ),
                                                                    shape: BoxShape
                                                                        .rectangle),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  '${itemStatus[index]['value']}',
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          AppSizeFont
                                                                              .xxl,
                                                                      color: AppColors
                                                                          .secondary),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              70),
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3,
                                                                  child: Center(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Text(
                                                                          itemStatus[index]['status']
                                                                              as String,
                                                                          style: const TextStyle(
                                                                              fontSize: AppSizeFont.lg,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: AppColors.grey),
                                                                        ),
                                                                        SvgPicture
                                                                            .asset(
                                                                          itemStatus[index]['icon']
                                                                              as String,
                                                                          fit: BoxFit
                                                                              .fitHeight,
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              50,
                                                                          colorFilter:
                                                                              const ColorFilter.mode(
                                                                            AppColors.grey,
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
                                                              5,
                                                              (indexDots) {
                                                                return Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              2),
                                                                  width: 8,
                                                                  height: index ==
                                                                          indexDots
                                                                      ? 30
                                                                      : 8,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      color: index ==
                                                                              indexDots
                                                                          ? AppColors
                                                                              .light
                                                                          : AppColors
                                                                              .hover,
                                                                      border: Border.all(
                                                                          color:
                                                                              AppColors.primary)),
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
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
                                        color: Colors.white.withOpacity(0.5),
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
                                              "Taksasi",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        height: 100,
                                        width: 100,
                                        padding: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: isLoading
                                            ? const SkeletonLine(
                                                style: SkeletonLineStyle(
                                                    height: 20,
                                                    width: 100,
                                                    alignment:
                                                        Alignment.centerRight),
                                              )
                                            : Text(
                                                NumberFormat('#,###')
                                                    .format(1000),
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
                                        color: Colors.white.withOpacity(0.5),
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
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        height: 100,
                                        width: 100,
                                        padding: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: isLoading
                                            ? const SkeletonLine(
                                                style: SkeletonLineStyle(
                                                    height: 20,
                                                    width: 100,
                                                    alignment:
                                                        Alignment.centerRight),
                                              )
                                            : Text(
                                                NumberFormat('#,###')
                                                    .format(10000),
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
                                        color: Colors.white.withOpacity(0.5),
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
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        height: 100,
                                        width: 100,
                                        padding: const EdgeInsets.only(top: 25),
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: isLoading
                                            ? const SkeletonLine(
                                                style: SkeletonLineStyle(
                                                    height: 20,
                                                    width: 100,
                                                    alignment:
                                                        Alignment.centerRight),
                                              )
                                            : Text(
                                                NumberFormat('#,###')
                                                    .format(10),
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
    );
  }
}
