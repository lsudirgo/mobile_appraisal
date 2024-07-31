// ignore_for_file: valid_regexps
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_appraisal/presentation/auth/bloc/getuser/getuser_bloc.dart';
import 'package:mobile_appraisal/presentation/auth/bloc/registeruser/registeruser_bloc.dart';
import 'package:mobile_appraisal/presentation/auth/pages/login_page.dart';
import '../../../core/core.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  late final TextEditingController userIdController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final FocusNode _focusNodeNewPassword1 = FocusNode();
  bool isShowPasswordRegister = false;
  bool isShowConfirmPasswordRegister = false;

  bool _showPasswordCriteria = false;
  double _sizeContainerCreteria = 34.0;

  bool _isLengthValid = false;
  bool _hasPasswordUpper = false;
  bool _hasPasswordSpecialChar = false;
  bool _hasPasswordNumber = false;
  bool _btnRegister = true;
  bool _readOnlyfield = true;
  bool _readOnlyFieldUser = false;

  String? _passwordError = '';

  void _onUserIdChanged() {
    if (userIdController.text.isNotEmpty) {
      context
          .read<GetuserBloc>()
          .add(GetuserEvent.getuser(userIdController.text));
    }
  }

  void _onClickRegister() {
    if (userIdController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      context.read<RegisteruserBloc>().add(RegisteruserEvent.registeruser(
          userIdController.text,
          passwordController.text,
          confirmPasswordController.text));
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
      passwordController.text.contains(RegExp(r'[A-Z]'))
          ? _hasPasswordUpper = true
          : _hasPasswordUpper = false;
      passwordController.text.contains(RegExp(r'[0-9]'))
          ? _hasPasswordNumber = true
          : _hasPasswordNumber = false;
      passwordController.text.contains(RegExp(r'[@\$!%*?&]'))
          ? _hasPasswordSpecialChar = true
          : _hasPasswordSpecialChar = false;
      passwordController.text.length >= 8
          ? _isLengthValid = true
          : _isLengthValid = false;

      _enabledBtnRegister();
      _validatePasswords();
    });
  }

  void _enabledBtnRegister() {
    setState(() {
      userIdController.text.isNotEmpty &&
              _isLengthValid &&
              _hasPasswordUpper &&
              _hasPasswordSpecialChar &&
              _hasPasswordNumber &&
              passwordController.text == confirmPasswordController.text
          ? _btnRegister = false
          : _btnRegister = true;
    });
  }

  void _validatePasswords() {
    setState(() {
      if (passwordController.text != confirmPasswordController.text) {
        _passwordError = 'Confirmation Password do not match';
      } else {
        _passwordError = null;
      }
      _enabledBtnRegister();
    });
  }

  @override
  void initState() {
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _focusNodeNewPassword1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Untuk menghindari overlay keyboard
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ClipPathClass(),
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.primary, // Ubah dengan warna latar belakang Anda
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
                        "Register",
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
      body: BlocListener<GetuserBloc, GetuserState>(
        listener: (context, state) {
          state.maybeMap(
            loading: (_) {},
            error: (errorState) {
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
                        AppConfig.imgEmptyDataNull.toString(),
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SpaceHeight(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          size: 50,
                          color: AppColors.red,
                        ),
                        const SpaceWidth(8),
                        Expanded(
                          child: Text(
                            errorState.error,
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
              final result = successState.result.result;
              if (result!.userId.isNotEmpty) {
                _readOnlyfield = false;
                _readOnlyFieldUser = true;
              } else {
                _readOnlyFieldUser = false;
                _readOnlyfield = true;
              }

              showBottomDialog(
                context: context,
                heightFactor: 0.4,
                paddingTop: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.check_circle_outline_rounded,
                        size: 80,
                        color: AppColors.green,
                      ),
                    ),
                    const SpaceHeight(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.assignment_ind_rounded,
                          size: AppSizeFont.lg,
                        ),
                        const SpaceWidth(4),
                        Text(
                          result.nipUser,
                          style: const TextStyle(
                            fontSize: AppSizeFont.md,
                            color: AppColors.greydark,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.person_pin,
                          size: AppSizeFont.lg,
                        ),
                        const SpaceWidth(4),
                        Text(
                          result.namaUser,
                          style: const TextStyle(
                            fontSize: AppSizeFont.md,
                            color: AppColors.greydark,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.work_history_rounded,
                          size: AppSizeFont.lg,
                        ),
                        const SpaceWidth(4),
                        Text(
                          result.bagianUser,
                          style: const TextStyle(
                            fontSize: AppSizeFont.md,
                            color: AppColors.greydark,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.apartment_rounded,
                          size: AppSizeFont.lg,
                        ),
                        const SpaceWidth(4),
                        Text(
                          result.unitkerjaUser,
                          style: const TextStyle(
                            fontSize: AppSizeFont.md,
                            color: AppColors.greydark,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Button.filled(
                        color: AppColors.secondary,
                        onPressed: () {
                          Navigator.pop(context);
                          FocusScope.of(context)
                              .requestFocus(_focusNodeNewPassword1);
                        },
                        label: 'OK',
                      ),
                    )
                  ],
                ),
              );
            },
            orElse: () {},
          );
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<GetuserBloc, GetuserState>(
              builder: (context, state) {
                return state.maybeMap(
                  loading: (loadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  },
                  orElse: () {
                    // Default UI when not loading
                    return Column(
                      children: <Widget>[
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: userIdController,
                                  label: 'UserID / Email Address',
                                  showLabel: false,
                                  readOnly: _readOnlyFieldUser,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      Assets.icons.email,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  suffixIcon: state.maybeMap(
                                    orElse: () => InkWell(
                                      onTap: () {
                                        _onUserIdChanged();
                                      },
                                      child: const Icon(
                                        Icons.search,
                                        size: 35,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    _enabledBtnRegister();
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: const BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: AppColors.primary),
                                              ),
                                            ),
                                            child: SizedBox(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Text(
                                                      "Creteria Password",
                                                      style: TextStyle(
                                                        fontSize:
                                                            AppSizeFont.md,
                                                        color: AppColors.white,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 5),
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
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            !_isLengthValid
                                                                ? Icons
                                                                    .circle_outlined
                                                                : Icons
                                                                    .check_circle_outline,
                                                            size:
                                                                AppSizeFont.xxl,
                                                            color:
                                                                !_isLengthValid
                                                                    ? AppColors
                                                                        .grey
                                                                    : AppColors
                                                                        .green,
                                                          ),
                                                          const SpaceWidth(10),
                                                          const Text(
                                                            "Minimal 8 Karakter",
                                                            style: TextStyle(
                                                              fontSize:
                                                                  AppSizeFont
                                                                      .md,
                                                              color: AppColors
                                                                  .black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SpaceHeight(2),
                                                    Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            !_hasPasswordUpper
                                                                ? Icons
                                                                    .circle_outlined
                                                                : Icons
                                                                    .check_circle_outline,
                                                            size:
                                                                AppSizeFont.xxl,
                                                            color:
                                                                !_hasPasswordUpper
                                                                    ? AppColors
                                                                        .grey
                                                                    : AppColors
                                                                        .green,
                                                          ),
                                                          const SpaceWidth(10),
                                                          const Expanded(
                                                            child: Text(
                                                              "Minimal 1 Mengandung Huruf Besar",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    AppSizeFont
                                                                        .md,
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SpaceHeight(2),
                                                    Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            !_hasPasswordNumber
                                                                ? Icons
                                                                    .circle_outlined
                                                                : Icons
                                                                    .check_circle_outline,
                                                            size:
                                                                AppSizeFont.xxl,
                                                            color:
                                                                !_hasPasswordNumber
                                                                    ? AppColors
                                                                        .grey
                                                                    : AppColors
                                                                        .green,
                                                          ),
                                                          const SpaceWidth(10),
                                                          const Expanded(
                                                            child: Text(
                                                              "Minimal 1 Mengandung Angka",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    AppSizeFont
                                                                        .md,
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SpaceHeight(2),
                                                    Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            !_hasPasswordSpecialChar
                                                                ? Icons
                                                                    .circle_outlined
                                                                : Icons
                                                                    .check_circle_outline,
                                                            size:
                                                                AppSizeFont.xxl,
                                                            color:
                                                                !_hasPasswordSpecialChar
                                                                    ? AppColors
                                                                        .grey
                                                                    : AppColors
                                                                        .green,
                                                          ),
                                                          const SpaceWidth(10),
                                                          const Expanded(
                                                            child: Text(
                                                              "Minimal 1 Mengandung Special Karakter (@\$!%*?&)",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    AppSizeFont
                                                                        .md,
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
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
                                  controller: passwordController,
                                  label: 'New Password',
                                  showLabel: false,
                                  obscureText: !isShowPasswordRegister,
                                  focusNode: _focusNodeNewPassword1,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      Assets.icons.password,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  readOnly: _readOnlyfield,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isShowPasswordRegister
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isShowPasswordRegister =
                                            !isShowPasswordRegister;
                                      });
                                    },
                                  ),
                                  onChanged: (value) {
                                    _checkPasswordStrength();
                                  },
                                ),
                                const SpaceHeight(10),
                                CustomTextField(
                                  controller: confirmPasswordController,
                                  label: 'Confirmation Password',
                                  showLabel: false,
                                  obscureText: !isShowConfirmPasswordRegister,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      Assets.icons.password,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  readOnly: _readOnlyfield,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isShowConfirmPasswordRegister
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isShowConfirmPasswordRegister =
                                            !isShowConfirmPasswordRegister;
                                      });
                                    },
                                  ),
                                  onChanged: (value) {
                                    _validatePasswords();
                                  },
                                  errorText: passwordController.text.isNotEmpty
                                      ? _passwordError
                                      : null,
                                ),
                                const SpaceHeight(20),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              BlocListener<RegisteruserBloc, RegisteruserState>(
                                listener: (context, state) {
                                  state.maybeMap(
                                    success: (succesState) {
                                      final resultResponse = succesState.result;
                                      showBottomDialog(
                                        enableDrag: false,
                                        isDismissible: false,
                                        context: context,
                                        heightFactor: 0.3,
                                        paddingTop: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons
                                                    .check_circle_outline_rounded,
                                                size: 80,
                                                color: AppColors.green,
                                              ),
                                            ),
                                            const SpaceHeight(4),
                                            Text(
                                              '${resultResponse.message}',
                                              style: const TextStyle(
                                                fontSize: AppSizeFont.lg,
                                                color: AppColors.greydark,
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Button.filled(
                                                color: AppColors.secondary,
                                                onPressed: () {
                                                  context
                                                      .push(const LoginPage());
                                                },
                                                label: 'Login',
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    error: (errorState) {
                                      showBottomDialog(
                                        context: context,
                                        heightFactor: 0.3,
                                        paddingTop: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
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
                                                    errorState.error,
                                                    maxLines: 3,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: const TextStyle(
                                                      fontSize: AppSizeFont.md,
                                                      color: AppColors.greydark,
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
                                    orElse: () {},
                                  );
                                },
                                child: BlocBuilder<RegisteruserBloc,
                                    RegisteruserState>(
                                  builder: (context, state) {
                                    return state.maybeMap(
                                      loading: (_) {
                                        return Button.filled(
                                          onPressed: () {
                                            null;
                                          },
                                          label: '',
                                          disabled: true,
                                          suffixIcon:
                                              const CircularProgressIndicator(),
                                        );
                                      },
                                      orElse: () => Button.filled(
                                        onPressed: () {
                                          _onClickRegister();
                                        },
                                        label: 'Register',
                                        disabled: _btnRegister,
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
