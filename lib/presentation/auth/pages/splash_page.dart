import 'package:flutter/material.dart';
import 'package:mobile_appraisal/presentation/auth/pages/login_page.dart';

import '../../../core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => context.pushReplacement(const LoginPage()),
    );
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Assets.images.start.image(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
