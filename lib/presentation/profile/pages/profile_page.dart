import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../../core/core.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  final responseStatus = 200;
  final responseMsg = "Success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: !isLoading && responseStatus != 200
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Connection Error : $responseMsg",
                            style: const TextStyle(
                              fontSize: AppSizeFont.md,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton.icon(
                            icon: Icon(!isLoading
                                ? Icons.refresh
                                : Icons.assignment_ind_rounded),
                            label: Text(
                              !isLoading ? "Reload" : "Mohon Tunggu..",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.background,
                            ),
                            onPressed: () async {},
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  controller: ScrollController(
                    keepScrollOffset: false,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipPath(
                            clipper: ClipPathClass(),
                            child: Container(
                              alignment: Alignment.center,
                              height: 450,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 28, 192, 169),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 50.0,
                                  ),
                                  isLoading
                                      ? const SkeletonAvatar(
                                          style: SkeletonAvatarStyle(
                                              width: 50,
                                              height: 50,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100))),
                                        )
                                      : Image.asset(
                                          Assets.images.iconsProfileMan.path,
                                          width: 50,
                                          height: 50,
                                        ),
                                  isLoading
                                      ? const SkeletonLine(
                                          style: SkeletonLineStyle(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 150,
                                          ),
                                        )
                                      : const Text(
                                          "Ling Sudirgo Praja",
                                          style: TextStyle(
                                            fontSize: AppSizeFont.md,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  isLoading
                                      ? const SkeletonLine(
                                          style: SkeletonLineStyle(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 100,
                                          ),
                                        )
                                      : const Text(
                                          '08376247264726742',
                                          style: TextStyle(
                                            fontSize: AppSizeFont.md,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  isLoading
                                      ? const SkeletonLine(
                                          style: SkeletonLineStyle(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 150,
                                          ),
                                        )
                                      : const Text(
                                          'ling.sudirgo@ui.ac.id',
                                          style: TextStyle(
                                            fontSize: AppSizeFont.md,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  isLoading
                                      ? const SkeletonLine(
                                          style: SkeletonLineStyle(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 150,
                                          ),
                                        )
                                      : const Text(
                                          '08 Agustus 1987',
                                          style: TextStyle(
                                            fontSize: AppSizeFont.md,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  isLoading
                                      ? const SkeletonLine(
                                          style: SkeletonLineStyle(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 80,
                                          ),
                                        )
                                      : const Text(
                                          'Laki - laki',
                                          style: TextStyle(
                                            fontSize: AppSizeFont.md,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: AlignmentDirectional.center,
                                      height: 40,
                                      width: 150,
                                      decoration: const BoxDecoration(
                                        color: AppColors.secondary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30.0),
                                        ),
                                      ),
                                      child: isLoading
                                          ? const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: CircularProgressIndicator(
                                                strokeWidth: 3.0,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.white),
                                              ),
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.edit,
                                                  size: AppSizeFont.md,
                                                  color: Colors.grey[700],
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Update Profile",
                                                  style: TextStyle(
                                                    fontSize: AppSizeFont.md,
                                                    color: Colors.grey[700],
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
                      const Text(
                        "Version : 0.0.1",
                        style: TextStyle(
                          fontSize: AppSizeFont.md,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      InkWell(
                        onTap: () async {
                          showButtomDialog(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppConfig.imgLogOut.toString(),
                                  width: 120.0,
                                  height: 120.0,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 80,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.message_rounded,
                                          size: 70.0,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 3.0,
                                              color: AppColors.hover,
                                            )
                                          ],
                                          color: AppColors.background,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Text(
                                            "Yakin nih mau keluar dari aplikasi ini?",
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: AppSizeFont.md,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Button.filled(
                                    onPressed: () {},
                                    label: 'Log Out',
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          height: 40,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_sharp,
                                size: AppSizeFont.md,
                                color: AppColors.red,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Keluar",
                                style: TextStyle(
                                  fontSize: AppSizeFont.md,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
