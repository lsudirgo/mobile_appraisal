import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';

import '../../../core/core.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isLoading = true;

  playLoading() async {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    playLoading();
    super.initState();
  }

  @override
  void dispose() {
    playLoading();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                                  Row(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: isLoading
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
                                              Assets
                                                  .images.iconsProfileMan.path,
                                              width: 50,
                                              height: 50,
                                            ),
                                    ),
                                    const SpaceWidth(5),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: isLoading
                                          ? const SkeletonLine(
                                              style: SkeletonLineStyle(
                                                height: 20,
                                              ),
                                            )
                                          : const Text(
                                              "Ling Sudirgo Rahardian Putra",
                                              style: TextStyle(
                                                fontSize: AppSizeFont.md,
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
                              onTap: () => {},
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
                      isLoading
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
                          : const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.home_work_rounded,
                                      size: AppSizeFont.xxl,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "AFO Padang Sidempuan",
                                      style: TextStyle(
                                        fontSize: AppSizeFont.md,
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
                              height: MediaQuery.of(context).size.height / 4,
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
                                            fontSize: AppSizeFont.md,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.pending_actions,
                                          size: 22.0,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SpaceHeight(5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
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
                                  const SpaceHeight(10),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 13,
                                                backgroundColor:
                                                    AppColors.primary,
                                                child: Icon(
                                                  Icons.arrow_circle_right,
                                                  color: Colors.white,
                                                  size: 19,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Disposisi",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor:
                                                  AppColors.primary,
                                              child: Icon(
                                                Icons.arrow_circle_right,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "OTS",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor:
                                                  AppColors.primary,
                                              child: Icon(
                                                Icons.arrow_circle_right,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "On Desk",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        isLoading
                                            ? const SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              )
                                            : const Text(
                                                "10",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                        isLoading
                                            ? const SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              )
                                            : const Text(
                                                "4",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                        isLoading
                                            ? const SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              )
                                            : const Text(
                                                "2",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 13,
                                                backgroundColor:
                                                    AppColors.primary,
                                                child: Icon(
                                                  Icons.arrow_circle_right,
                                                  color: Colors.white,
                                                  size: 19,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Reviewer",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor:
                                                  AppColors.primary,
                                              child: Icon(
                                                Icons.arrow_circle_right,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Approval",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        isLoading
                                            ? const SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              )
                                            : const Text(
                                                "5",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                        const SizedBox(
                                          width: 70,
                                        ),
                                        isLoading
                                            ? const SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              )
                                            : const Text(
                                                "1",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                                  height:
                                      MediaQuery.of(context).size.height / 8,
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
