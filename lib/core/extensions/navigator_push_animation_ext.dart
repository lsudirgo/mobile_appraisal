import 'package:flutter/material.dart';
import 'package:mobile_appraisal/core/extensions/state_util.dart';

Future navigatorPushAnimation(pushView, int duration) async {
  await Navigator.push<void>(
    globalContext,
    PageRouteBuilder(
      transitionDuration: Duration(milliseconds: duration), // durasi animasi
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return pushView; // widget halaman berikutnya
      },
    ),
  );
}
