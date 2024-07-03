import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';

import 'package:mobile_appraisal/presentation/auth/bloc/loginuser/loginuser_bloc.dart';
import 'package:mobile_appraisal/presentation/auth/pages/changepass_page.dart';
import 'package:mobile_appraisal/presentation/auth/pages/register_page.dart';
import 'package:mobile_appraisal/presentation/home/pages/main_page.dart';

import '../../../core/core.dart';
import '../../../data/datasources/auth/auth_local_datasource.dart';
import '../../../data/datasources/auth/auth_user_remote_datasource.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final FocusNode _focusNodeemailController = FocusNode();
  final FocusNode _focusNodepasswordController = FocusNode();
  bool isShowPassword = false;

  final LoginuserBloc _loginuserBloc =
      LoginuserBloc(AuthUserRemoteDatasource());

  void _onClickLogin() {
    if (emailController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_focusNodeemailController);
    } else if (passwordController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_focusNodepasswordController);
    } else if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      _loginuserBloc.add(LoginuserEvent.authLogin(
          emailController.text, passwordController.text));
    }
  }

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
    _focusNodeemailController.dispose();
    _focusNodepasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _loginuserBloc,
        child: SingleChildScrollView(
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
                            focusNode: _focusNodeemailController,
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
                            focusNode: _focusNodepasswordController,
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
                          BlocConsumer<LoginuserBloc, LoginuserState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                orElse: () {},
                                error: (errorState) {
                                  showBottomDialog(
                                    context: context,
                                    heightFactor: 0.3,
                                    paddingTop: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.asset(
                                            AppConfig.imgEmptyDataNull
                                                .toString(),
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SpaceHeight(4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.info_outline_rounded,
                                              size: 50,
                                              color: AppColors.red,
                                            ),
                                            const SpaceWidth(8),
                                            Expanded(
                                              child: Text(
                                                errorState,
                                                maxLines: 3,
                                                textAlign: TextAlign.justify,
                                                style: const TextStyle(
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
                                },
                                success: (successState) {
                                  AuthLocalDatasource()
                                      .saveAuthData(successState);

                                  context.pushReplacement(const MainPage());
                                },
                              );
                            },
                            builder: (context, state) {
                              return state.maybeWhen(
                                loading: () {
                                  return Button.filled(
                                    onPressed: () {
                                      null;
                                    },
                                    label: '',
                                    disabled: true,
                                    suffixIcon: const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator()),
                                  );
                                },
                                orElse: () {
                                  return Button.filled(
                                    onPressed: () {
                                      _onClickLogin();
                                    },
                                    label: 'Sign In',
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                                onPressed: () {
                                  context.push(const RegisterPage());
                                },
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
