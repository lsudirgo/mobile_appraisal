import 'package:flutter/material.dart';
import 'package:mobile_appraisal/core/core.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';
import 'package:mobile_appraisal/presentation/job/page/disposisi_list_page.dart';
import 'package:mobile_appraisal/presentation/job/page/inspection_list_page.dart';

class MainJobPage extends StatefulWidget {
  const MainJobPage({super.key});

  @override
  State<MainJobPage> createState() => _MainJobPageState();
}

class _MainJobPageState extends State<MainJobPage> {
  String? _roleApproval;

  Future<void> _getAuthorization() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final data = authData?.result?.detailData;
    if (data != null) {
      setState(() {
        _roleApproval = data.otorisator;
      });
    } else {
      setState(() {
        _roleApproval = 'T';
      });
    }
  }

  @override
  void initState() {
    _getAuthorization();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _getAuthorization();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 110,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ClipPathClassAppBar(),
          child: Container(
            alignment: Alignment.topCenter,
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Main Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppSizeFont.xl,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.work_outline_rounded,
                          size: AppSizeFont.xxl,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            if (_roleApproval == 'Y') {
                              context.push(const DisposisiListPage());
                            } else {
                              showBottomDialog(
                                context: context,
                                heightFactor: 0.3,
                                paddingTop: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        Assets.images.bloCK.path,
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SpaceHeight(4),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.info_outline_rounded,
                                          size: 50,
                                          color: AppColors.red,
                                        ),
                                        SpaceWidth(8),
                                        Expanded(
                                          child: Text(
                                            'Anda Tidak Memiliki Hak Akses Menu Disposisi',
                                            maxLines: 3,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: AppSizeFont.md,
                                              color: AppColors.greydark,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      bottom: -10,
                                      right: -5,
                                      child: Icon(
                                        Icons.ads_click_sharp,
                                        size: 60,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      8), // Menggunakan SizedBox untuk spasi vertikal
                              const Text(
                                "disposisi",
                                style: TextStyle(
                                  color: AppColors.greydark,
                                  fontSize: AppSizeFont.sm,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            {
                              context.push(const InspectionListPage());
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      bottom: -10,
                                      right: -5,
                                      child: Icon(
                                        Icons.directions_car_filled_outlined,
                                        size: 60,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      8), // Menggunakan SizedBox untuk spasi vertikal
                              const Text(
                                "inspection",
                                style: TextStyle(
                                  color: AppColors.greydark,
                                  fontSize: AppSizeFont.sm,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    bottom: -10,
                                    right: -10,
                                    child: Icon(
                                      Icons.screen_search_desktop_outlined,
                                      size: 60,
                                      color: AppColors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    8), // Menggunakan SizedBox untuk spasi vertikal
                            const Text(
                              "ondesk",
                              style: TextStyle(
                                color: AppColors.greydark,
                                fontSize: AppSizeFont.sm,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    bottom: -15,
                                    right: -15,
                                    child: Icon(
                                      Icons.app_registration_rounded,
                                      size: 60,
                                      color: AppColors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    8), // Menggunakan SizedBox untuk spasi vertikal
                            const Text(
                              "reviewer",
                              style: TextStyle(
                                color: AppColors.greydark,
                                fontSize: AppSizeFont.sm,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeight(12),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    bottom: -10,
                                    right: -15,
                                    child: Icon(
                                      Icons.approval_rounded,
                                      size: 60,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    8), // Menggunakan SizedBox untuk spasi vertikal
                            const Text(
                              "approval",
                              style: TextStyle(
                                color: AppColors.greydark,
                                fontSize: AppSizeFont.sm,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    bottom: -15,
                                    right: -15,
                                    child: Icon(
                                      Icons.repeat_rounded,
                                      size: 60,
                                      color: AppColors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    8), // Menggunakan SizedBox untuk spasi vertikal
                            const Text(
                              "back",
                              style: TextStyle(
                                color: AppColors.greydark,
                                fontSize: AppSizeFont.sm,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    bottom: -15,
                                    right: -15,
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: 60,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    8), // Menggunakan SizedBox untuk spasi vertikal
                            const Text(
                              "collect data",
                              style: TextStyle(
                                color: AppColors.greydark,
                                fontSize: AppSizeFont.sm,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    bottom: -15,
                                    right: -15,
                                    child: Icon(
                                      Icons.home,
                                      size: 60,
                                      color: AppColors.blueLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height:
                                    8), // Menggunakan SizedBox untuk spasi vertikal
                            const Text(
                              "blanked",
                              style: TextStyle(
                                color: AppColors.greydark,
                                fontSize: AppSizeFont.sm,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(2),
          ],
        ),
      ),
    );
  }
}
