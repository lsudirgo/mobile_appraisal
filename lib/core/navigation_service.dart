import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void redirectToLogin() {
  navigatorKey.currentState?.pushReplacementNamed('/loginexpired');
}
