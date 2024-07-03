import 'package:flutter/material.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';
import 'package:mobile_appraisal/presentation/auth/pages/login_page.dart';
import 'package:mobile_appraisal/presentation/home/pages/main_page.dart';

import '../../../core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Tunggu 2 detik, kemudian navigasi ke LoginPage
    Future.delayed(
      const Duration(seconds: 2),
      () => navigateToNextPage(),
    );
  }

  void navigateToNextPage() async {
    if (mounted) {
      bool isLoggedIn = await AuthLocalDatasource().isAuth();

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                isLoggedIn ? const MainPage() : const LoginPage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Assets.images.start.image(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
