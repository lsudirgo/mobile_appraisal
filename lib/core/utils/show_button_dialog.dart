import 'package:flutter/material.dart';
import 'package:mobile_appraisal/core/extensions/state_util.dart';

import '../core.dart';

Future showButtomDialog({
  required Widget child,
  final heightfactor = 0.6,
}) async {
  await showModalBottomSheet<void>(
      context: globalContext,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 1,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: AppColors.light,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: heightfactor,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      width: 30.0,
                      height: 5.0, // Tinggi baris
                      color: Colors.grey[300], // Warna garis
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(
                    color: AppColors.light,
                  ),
                  Center(
                    child: child,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
