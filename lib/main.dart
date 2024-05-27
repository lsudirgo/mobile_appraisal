import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core.dart';
import 'presentation/auth/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.nameApp,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        dividerTheme: DividerThemeData(color: AppColors.light.withOpacity(0.5)),
        dialogTheme: const DialogTheme(elevation: 0),
        textTheme: GoogleFonts.kumbhSansTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.kumbhSans(
            color: AppColors.black,
            fontSize: AppSizeFont.xxl,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const SplashPage(),
    );
  }
}
