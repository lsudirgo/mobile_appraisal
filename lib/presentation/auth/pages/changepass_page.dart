import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_user_remote_datasource.dart';
import 'package:mobile_appraisal/presentation/auth/bloc/resetpassword/resetpassword_bloc.dart';
import 'package:mobile_appraisal/presentation/auth/pages/login_page.dart';

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

  bool _showPasswordCriteria = false;
  double _sizeContainerCreteria = 34.0;

  bool _isLengthValid = false;
  bool _hasPasswordUpper = false;
  bool _hasPasswordSpecialChar = false;
  bool _hasPasswordNumber = false;
  bool _btnGantiPass = true;
  String? _passwordError = '';

  final ResetpasswordBloc _resetpasswordBloc =
      ResetpasswordBloc(AuthUserRemoteDatasource());
  void _onClickGantiPass() {
    if (emailChangeController.text.isNotEmpty &&
        passwordChangeController1.text.isNotEmpty &&
        passwordChangeController2.text.isNotEmpty) {
      _resetpasswordBloc.add(ResetpasswordEvent.resetpassword(
          userid: emailChangeController.text,
          password: passwordChangeController1.text,
          confirmasipassword: passwordChangeController2.text));
    }
  }

  void _togglePasswordCriteria() {
    setState(() {
      _showPasswordCriteria = !_showPasswordCriteria;
      if (_showPasswordCriteria) {
        _sizeContainerCreteria = 175;
      } else {
        _sizeContainerCreteria = 34;
      }
    });
  }

  void _checkPasswordStrength() {
    setState(() {
      passwordChangeController1.text.contains(RegExp(r'[A-Z]'))
          ? _hasPasswordUpper = true
          : _hasPasswordUpper = false;
      passwordChangeController1.text.contains(RegExp(r'[0-9]'))
          ? _hasPasswordNumber = true
          : _hasPasswordNumber = false;
      passwordChangeController1.text.contains(RegExp(r'[@\$!%*?&]'))
          ? _hasPasswordSpecialChar = true
          : _hasPasswordSpecialChar = false;
      passwordChangeController1.text.length >= 8
          ? _isLengthValid = true
          : _isLengthValid = false;

      _enabledBtnGantiPass();
      _validateGantiPasswords();
    });
  }

  void _enabledBtnGantiPass() {
    setState(() {
      emailChangeController.text.isNotEmpty &&
              _isLengthValid &&
              _hasPasswordUpper &&
              _hasPasswordSpecialChar &&
              _hasPasswordNumber &&
              passwordChangeController1.text == passwordChangeController2.text
          ? _btnGantiPass = false
          : _btnGantiPass = true;
    });
  }

  void _validateGantiPasswords() {
    setState(() {
      if (passwordChangeController1.text != passwordChangeController2.text) {
        _passwordError = 'Confirmation Password do not match';
      } else {
        _passwordError = null;
      }
      _enabledBtnGantiPass();
    });
  }

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
    return BlocProvider(
      create: (context) => _resetpasswordBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Untuk menghindari overlay keyboard
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_circle_left,
                            size: 40.0,
                            color: Colors.white, // Ubah dengan warna ikon Anda
                          ),
                        ),
                        const Text(
                          "Change Password",
                          style: TextStyle(
                            color: Colors.white, // Ubah dengan warna teks Anda
                            fontSize: AppSizeFont
                                .lg, // Ubah dengan ukuran font yang sesuai
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                          onChanged: (value) {
                            _enabledBtnGantiPass();
                          },
                        ),
                        const SpaceHeight(10),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: Container(
                            height: _sizeContainerCreteria,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.fromBorderSide(
                                BorderSide(color: AppColors.primary),
                              ),
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: _togglePasswordCriteria,
                                  child: Container(
                                    height: 30,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.fromBorderSide(
                                        BorderSide(color: AppColors.primary),
                                      ),
                                    ),
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Creteria Password",
                                              style: TextStyle(
                                                fontSize: AppSizeFont.md,
                                                color: AppColors.white,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Icon(
                                              _showPasswordCriteria
                                                  ? Icons
                                                      .arrow_drop_down_outlined
                                                  : Icons
                                                      .arrow_drop_up_outlined,
                                              size: AppSizeFont.xxl,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SpaceHeight(2),
                                Visibility(
                                  visible: _showPasswordCriteria,
                                  child: Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    !_isLengthValid
                                                        ? Icons.circle_outlined
                                                        : Icons
                                                            .check_circle_outline,
                                                    size: AppSizeFont.xxl,
                                                    color: !_isLengthValid
                                                        ? AppColors.grey
                                                        : AppColors.green,
                                                  ),
                                                  const SpaceWidth(10),
                                                  const Text(
                                                    "Minimal 8 Karakter",
                                                    style: TextStyle(
                                                      fontSize: AppSizeFont.md,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SpaceHeight(2),
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    !_hasPasswordUpper
                                                        ? Icons.circle_outlined
                                                        : Icons
                                                            .check_circle_outline,
                                                    size: AppSizeFont.xxl,
                                                    color: !_hasPasswordUpper
                                                        ? AppColors.grey
                                                        : AppColors.green,
                                                  ),
                                                  const SpaceWidth(10),
                                                  const Expanded(
                                                    child: Text(
                                                      "Minimal 1 Mengandung Huruf Besar",
                                                      style: TextStyle(
                                                        fontSize:
                                                            AppSizeFont.md,
                                                        color: AppColors.black,
                                                      ),
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.visible,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SpaceHeight(2),
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    !_hasPasswordNumber
                                                        ? Icons.circle_outlined
                                                        : Icons
                                                            .check_circle_outline,
                                                    size: AppSizeFont.xxl,
                                                    color: !_hasPasswordNumber
                                                        ? AppColors.grey
                                                        : AppColors.green,
                                                  ),
                                                  const SpaceWidth(10),
                                                  const Expanded(
                                                    child: Text(
                                                      "Minimal 1 Mengandung Angka",
                                                      style: TextStyle(
                                                        fontSize:
                                                            AppSizeFont.md,
                                                        color: AppColors.black,
                                                      ),
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.visible,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SpaceHeight(2),
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    !_hasPasswordSpecialChar
                                                        ? Icons.circle_outlined
                                                        : Icons
                                                            .check_circle_outline,
                                                    size: AppSizeFont.xxl,
                                                    color:
                                                        !_hasPasswordSpecialChar
                                                            ? AppColors.grey
                                                            : AppColors.green,
                                                  ),
                                                  const SpaceWidth(10),
                                                  const Expanded(
                                                    child: Text(
                                                      "Minimal 1 Mengandung Special Karakter (@\$!%*?&)",
                                                      style: TextStyle(
                                                        fontSize:
                                                            AppSizeFont.md,
                                                        color: AppColors.black,
                                                      ),
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.visible,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SpaceHeight(10),
                        CustomTextField(
                          controller: passwordChangeController1,
                          label: 'New Password',
                          showLabel: false,
                          obscureText: !isShowPasswordChange1,
                          onChanged: (value) => _checkPasswordStrength(),
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
                                isShowPasswordChange1 = !isShowPasswordChange1;
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
                          onChanged: (value) => _validateGantiPasswords(),
                          errorText: passwordChangeController1.text.isNotEmpty
                              ? _passwordError
                              : null,
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
                                isShowPasswordChange2 = !isShowPasswordChange2;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocConsumer<ResetpasswordBloc, ResetpasswordState>(
                        listener: (context, state) {
                          state.maybeMap(
                            orElse: () {},
                            success: (value) {
                              final snackBar = SnackBar(
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'Informasi',
                                  message: value.result,
                                  contentType: ContentType.success,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);

                              context.pushReplacement(const LoginPage());
                            },
                            error: (value) {
                              showBottomDialog(
                                context: context,
                                heightFactor: 0.3,
                                paddingTop: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        AppConfig.imgEmptyDataNull.toString(),
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
                                            value.error,
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
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return Button.filled(
                                disabled: _btnGantiPass,
                                onPressed: () {
                                  _onClickGantiPass();
                                },
                                label: 'Ganti',
                              );
                            },
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
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
