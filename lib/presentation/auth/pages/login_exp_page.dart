import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_appraisal/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/datasources/auth/auth_local_datasource.dart';
import '../../home/pages/main_page.dart';
import '../bloc/loginuser/loginuser_bloc.dart';

class LoginExpPage extends StatefulWidget {
  const LoginExpPage({super.key});

  @override
  State<LoginExpPage> createState() => _LoginExpPageState();
}

class _LoginExpPageState extends State<LoginExpPage> {
  late final TextEditingController _passwordexpController;
  final FocusNode _focusNodepasswordexpController = FocusNode();
  bool _isShowPassword = false;
  Timer? _debounce;

  void _onChangeLoginexp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataString = prefs.getString('user');

    if (userDataString!.isNotEmpty && _passwordexpController.text.isNotEmpty) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(
        const Duration(seconds: 2),
        () {
          context.read<LoginuserBloc>().add(LoginuserEvent.authLogin(
              userDataString, _passwordexpController.text));
        },
      );
    }
  }

  @override
  void initState() {
    _passwordexpController = TextEditingController();
    // Mengatur fokus pada widget saat halaman dipanggil
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNodepasswordexpController);
    });

    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _passwordexpController.dispose();
    _focusNodepasswordexpController.dispose();
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
                height: 320,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Image.asset(
                  Assets.images.sessionExpired.path,
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
                          controller: _passwordexpController,
                          label: 'Password',
                          showLabel: false,
                          focusNode: _focusNodepasswordexpController,
                          obscureText: !_isShowPassword,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              Assets.icons.password,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          onChanged: (_) {
                            _onChangeLoginexp();
                          },
                          suffixIcon:
                              BlocConsumer<LoginuserBloc, LoginuserState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                orElse: () {},
                                success: (successState) async {
                                  AuthLocalDatasource()
                                      .saveAuthData(successState);

                                  //delete storage user

                                  context.pushReplacement(const MainPage(
                                    initialIndex: 0,
                                  ));
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.remove('user');
                                },
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
                                            Assets.images.warning.path,
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
                              );
                            },
                            builder: (context, state) {
                              return state.maybeWhen(
                                loading: () {
                                  return const SizedBox(
                                    height: 5,
                                    width: 5,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth:
                                            6, // Anda juga bisa mengatur strokeWidth agar sesuai
                                      ),
                                    ),
                                  );
                                },
                                orElse: () {
                                  return IconButton(
                                    icon: Icon(
                                      _isShowPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isShowPassword = !_isShowPassword;
                                      });
                                    },
                                  );
                                },
                              );
                            },
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
