import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController emailChangeController;
  late final TextEditingController passwordChangeController1;
  late final TextEditingController passwordChangeController2;
  bool isShowPasswordChange1 = false;
  bool isShowPasswordChange2 = false;

  @override
  void initState() {
    emailChangeController = TextEditingController();
    passwordChangeController1 = TextEditingController();
    passwordChangeController2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailChangeController.dispose();
    passwordChangeController1.dispose();
    passwordChangeController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
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
                  child: Image.asset(
                    Assets.images.forgotPassword.path,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.scaleDown,
                    semanticLabel: "Change Password",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_circle_left,
                              size: 40,
                              color: AppColors.light,
                              opticalSize: 200,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Ganti Password",
                          style: TextStyle(
                            color: AppColors.light,
                            fontSize: AppSizeFont.lg,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 230),
                    height: MediaQuery.of(context).size.height / 1,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      border: Border.all(
                        color: AppColors.background,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Form(
                      // key: ,
                      child: Expanded(
                        child: Column(
                          children: [
                            const SpaceHeight(10),
                            CustomTextField(
                              controller: emailChangeController,
                              label: 'UserID / Email Address',
                              showLabel: false,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  Assets.icons.email,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            const SpaceHeight(10),
                            CustomTextField(
                              controller: passwordChangeController1,
                              label: 'New Password',
                              showLabel: false,
                              obscureText: !isShowPasswordChange1,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  Assets.icons.password,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isShowPasswordChange1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isShowPasswordChange1 =
                                        !isShowPasswordChange1;
                                  });
                                },
                              ),
                            ),
                            const SpaceHeight(10),
                            CustomTextField(
                              controller: passwordChangeController2,
                              label: 'Confirmation Password',
                              showLabel: false,
                              obscureText: !isShowPasswordChange2,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  Assets.icons.password,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isShowPasswordChange2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isShowPasswordChange2 =
                                        !isShowPasswordChange2;
                                  });
                                },
                              ),
                            ),
                            const SpaceHeight(20),
                            Button.filled(
                              onPressed: () {
                                showBottomDialog(
                                  context: context,
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
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                              Icon(
                                                Icons.alternate_email,
                                                size: 70.0,
                                                shadows: const [
                                                  Shadow(
                                                    blurRadius: 3.0,
                                                    color: AppColors.background,
                                                  )
                                                ],
                                                color: Colors.grey[400],
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
                                          label: 'Sign In',
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              label: 'Ganti',
                            ),
                          ],
                        ),
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
