import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_appraisal/presentation/auth/pages/changepass_page.dart';

import '../../../core/core.dart';
import '../../home/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool isShowPassword = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(
          keepScrollOffset: false,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                alignment: Alignment.center,
                height: 340,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Image.asset(
                  Assets.images.login1.path,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 300),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    border: Border.all(
                      color: AppColors.background,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: emailController,
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
                          controller: passwordController,
                          label: 'Password',
                          showLabel: false,
                          obscureText: !isShowPassword,
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
                              isShowPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isShowPassword = !isShowPassword;
                              });
                            },
                          ),
                        ),
                        const SpaceHeight(1),
                        Container(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              context.push(const ForgotPasswordPage());
                            },
                            child: const Text(
                              "Lupa Password",
                              style: TextStyle(
                                fontSize: AppSizeFont.md,
                                color: AppColors.primary,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        const SpaceHeight(20),
                        Button.filled(
                          onPressed: () {
                            context.pushReplacement(const MainPage());
                          },
                          label: 'Sign In',
                        ),
                        const SpaceHeight(100),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: AppColors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Userid belum terdaftar ?",
                                style: TextStyle(
                                  fontSize: AppSizeFont.md,
                                  fontFamily: AutofillHints.countryCode,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Daftar",
                                  style: TextStyle(
                                    fontSize: AppSizeFont.md,
                                    fontFamily: AutofillHints.countryCode,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                    fontStyle: FontStyle.normal,
                                  ),
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
          ],
        ),
      ),
    );
  }
}
