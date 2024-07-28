import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';
import 'package:mobile_appraisal/presentation/auth/pages/login_page.dart';
import 'package:mobile_appraisal/presentation/profile/bloc/logout/logout_bloc.dart';
import 'package:mobile_appraisal/presentation/profile/pages/profile_changepass_page.dart';
import 'package:mobile_appraisal/presentation/profile/pages/profile_update_page.dart';
import 'package:skeletons/skeletons.dart';

import '../../../core/core.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoadingprofile = true;
  String? _name = '';
  String? _gender = '';
  String? _email = '';
  String? _level = '';
  String? _bagian = '';
  String? _nip = '';
  String? _jabatan = '';
  String? _userid = '';

  void playLoadingProfile() async {
    setState(() {
      isLoadingprofile = true;
    });
    final authData = await AuthLocalDatasource().getAuthData();

    final data = authData?.result?.detailData;
    if (data != null) {
      setState(() {
        _name = data.name;
        _email = '${data.userid}@bankbsi.co.id';
        _gender = data.gender;
        _level = data.level;
        _bagian = data.bagian;
        _nip = data.nip;
        _jabatan = data.jabatan;
        _userid = data.userid;
        isLoadingprofile = false;
      });
    }
  }

  @override
  void initState() {
    playLoadingProfile();
    super.initState();
  }

  @override
  void dispose() {
    playLoadingProfile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = _gender == 'Laki - laki'
        ? Assets.images.iconsProfileMan.path
        : Assets.images.iconsProfileGirl.path;
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(
          keepScrollOffset: false,
        ),
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
                      height: MediaQuery.of(context).size.height / 1.3,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                      ),
                      child: Column(
                        children: [
                          const SpaceHeight(50),
                          Container(
                            height: 70,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SpaceWidth(5),
                                  isLoadingprofile
                                      ? const SkeletonAvatar(
                                          style: SkeletonAvatarStyle(
                                              width: 50,
                                              height: 50,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100))),
                                        )
                                      : Image.asset(
                                          imagePath,
                                          width: 50,
                                          height: 50,
                                        ),
                                  const SpaceWidth(10),
                                  isLoadingprofile
                                      ? const Center(
                                          child: SkeletonLine(
                                            style: SkeletonLineStyle(
                                              alignment: Alignment.center,
                                              height: 20,
                                              width: 250,
                                            ),
                                          ),
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              _name!,
                                              style: const TextStyle(
                                                fontSize: AppSizeFont.lg,
                                                color: AppColors.greydark,
                                              ),
                                            ),
                                            Text(
                                              _nip!,
                                              style: const TextStyle(
                                                fontSize: AppSizeFont.lg,
                                                color: AppColors.greydark,
                                              ),
                                            ),
                                          ],
                                        ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () async {
                                      final updatedProfileData =
                                          await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileUpdatePage(
                                            profileData: {
                                              'name': _name,
                                              'gender': _gender,
                                              'level': _level,
                                              'bagian': _bagian,
                                              'idbagian': _jabatan,
                                              'nip': _nip,
                                            },
                                          ),
                                        ),
                                      );

                                      if (updatedProfileData != null) {
                                        setState(() {
                                          _gender =
                                              updatedProfileData['gender'];
                                          _level = updatedProfileData['level'];
                                          _bagian =
                                              updatedProfileData['bagian'];
                                          _jabatan =
                                              updatedProfileData['jabatan'];
                                        });
                                      }
                                    },
                                    child: const Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      color: AppColors.grey,
                                      size: 40,
                                    ),
                                  ),
                                  const SpaceWidth(5)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SpaceWidth(15),
                                  const Icon(
                                    Icons.gesture_rounded,
                                    color: AppColors.disabled,
                                    size: 30,
                                  ),
                                  const SpaceWidth(15),
                                  isLoadingprofile
                                      ? const SkeletonLine(
                                          style: SkeletonLineStyle(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 250,
                                          ),
                                        )
                                      : Text(
                                          _gender!,
                                          style: const TextStyle(
                                            fontSize: AppSizeFont.lg,
                                            color: AppColors.greydark,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SpaceWidth(15),
                                  const Icon(
                                    Icons.leaderboard_outlined,
                                    color: AppColors.disabled,
                                    size: 30,
                                  ),
                                  const SpaceWidth(15),
                                  isLoadingprofile
                                      ? const SkeletonLine(
                                          style: SkeletonLineStyle(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 250,
                                          ),
                                        )
                                      : Text(
                                          _level!,
                                          style: const TextStyle(
                                            fontSize: AppSizeFont.lg,
                                            color: AppColors.greydark,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SpaceWidth(15),
                                  const Icon(
                                    Icons.email_outlined,
                                    color: AppColors.disabled,
                                    size: 30,
                                  ),
                                  const SpaceWidth(15),
                                  isLoadingprofile
                                      ? const SkeletonLine(
                                          style: SkeletonLineStyle(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 250,
                                          ),
                                        )
                                      : Text(
                                          _email!,
                                          style: const TextStyle(
                                            fontSize: AppSizeFont.lg,
                                            color: AppColors.greydark,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              minHeight: 40,
                              maxHeight: 80,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SpaceWidth(15),
                                    const Icon(
                                      Icons.work_rounded,
                                      color: AppColors.disabled,
                                      size: 30,
                                    ),
                                    const SpaceWidth(15),
                                    Flexible(
                                      child: Text(
                                        _bagian!,
                                        style: const TextStyle(
                                          fontSize: AppSizeFont.lg,
                                          color: AppColors.greydark,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SpaceHeight(1),
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  12.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SpaceWidth(15),
                                  const Icon(
                                    Icons.lock,
                                    color: AppColors.disabled,
                                    size: 30,
                                  ),
                                  const SpaceWidth(10),
                                  const Text(
                                    'Ganti Password',
                                    style: TextStyle(
                                      fontSize: AppSizeFont.lg,
                                      color: AppColors.greydark,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileForgotPasswordPage(
                                            useridLogin: _userid.toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      color: AppColors.grey,
                                      size: 40,
                                    ),
                                  ),
                                  const SpaceWidth(5)
                                ],
                              ),
                            ),
                          ),
                          const SpaceHeight(1),
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  12.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SpaceWidth(15),
                                  const Icon(
                                    Icons.logout_rounded,
                                    color: AppColors.disabled,
                                    size: 30,
                                  ),
                                  const SpaceWidth(10),
                                  const Text(
                                    'Keluar',
                                    style: TextStyle(
                                      fontSize: AppSizeFont.lg,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      showBottomDialog(
                                        context: context,
                                        heightFactor: 0.4,
                                        paddingTop: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              AppConfig.imgLogOut.toString(),
                                              width: 120.0,
                                              height: 120.0,
                                              fit: BoxFit.cover,
                                            ),
                                            const SpaceHeight(2),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Container(
                                                height: 80,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(25.0),
                                                  ),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .info_outline_rounded,
                                                      size: 70.0,
                                                      shadows: [
                                                        Shadow(
                                                          blurRadius: 3.0,
                                                          color: AppColors
                                                              .background,
                                                        )
                                                      ],
                                                      color: AppColors.red,
                                                    ),
                                                    const SpaceHeight(10),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: const Text(
                                                          "Yakin nih mau keluar dari aplikasi ini?",
                                                          style: TextStyle(
                                                            color:
                                                                AppColors.grey,
                                                            fontSize:
                                                                AppSizeFont.lg,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          maxLines: 3,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                BlocConsumer<LogoutBloc,
                                                    LogoutState>(
                                                  listener: (context, state) {
                                                    state.maybeMap(
                                                      orElse: () {},
                                                      success: (success) {
                                                        final snackBar =
                                                            SnackBar(
                                                          elevation: 0,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          content:
                                                              AwesomeSnackbarContent(
                                                            title: 'Informasi',
                                                            message:
                                                                success.result,
                                                            contentType:
                                                                ContentType
                                                                    .success,
                                                          ),
                                                        );

                                                        ScaffoldMessenger.of(
                                                            context)
                                                          ..hideCurrentSnackBar()
                                                          ..showSnackBar(
                                                              snackBar);

                                                        context.pushReplacement(
                                                            const LoginPage());
                                                      },
                                                      error: (valueError) {
                                                        showBottomDialog(
                                                          context: context,
                                                          heightFactor: 0.3,
                                                          paddingTop: 1,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        4.0),
                                                                child:
                                                                    Image.asset(
                                                                  AppConfig
                                                                      .imgEmptyDataNull
                                                                      .toString(),
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              const SpaceHeight(
                                                                  4),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .info_outline_rounded,
                                                                    size: 50,
                                                                    color:
                                                                        AppColors
                                                                            .red,
                                                                  ),
                                                                  const SpaceWidth(
                                                                      8),
                                                                  Expanded(
                                                                    child: Text(
                                                                      valueError
                                                                          .error,
                                                                      maxLines:
                                                                          3,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            AppSizeFont.md,
                                                                        color: AppColors
                                                                            .greydark,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  builder: (context, state) {
                                                    return state.maybeWhen(
                                                      orElse: () {
                                                        return Button.filled(
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    LogoutBloc>()
                                                                .add(
                                                                  const LogoutEvent
                                                                      .logOut(),
                                                                );
                                                          },
                                                          label: 'OK',
                                                          color:
                                                              AppColors.white,
                                                          style: ButtonStyleType
                                                              .outlined,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2.8,
                                                          height: 50,
                                                          textColor:
                                                              AppColors.grey,
                                                        );
                                                      },
                                                      loading: () {
                                                        return Button.filled(
                                                          onPressed: () {
                                                            null;
                                                          },
                                                          disabled: true,
                                                          label: '',
                                                          color:
                                                              AppColors.white,
                                                          style: ButtonStyleType
                                                              .outlined,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2.8,
                                                          height: 50,
                                                          textColor:
                                                              AppColors.grey,
                                                          suffixIcon:
                                                              const SizedBox(
                                                                  height: 20,
                                                                  width: 20,
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                                const SpaceWidth(5),
                                                Button.filled(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  label: 'Cancel',
                                                  color: AppColors.primary,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.8,
                                                  height: 50,
                                                ),
                                              ],
                                            ),
                                            const SpaceHeight(15)
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      color: AppColors.disabled,
                                      size: 40,
                                    ),
                                  ),
                                  const SpaceWidth(5)
                                ],
                              ),
                            ),
                          ),
                          const SpaceHeight(50),
                          const Text(
                            "Version : 1.0.0",
                            style: TextStyle(
                              fontSize: AppSizeFont.md,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
