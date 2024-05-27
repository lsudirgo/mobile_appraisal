import 'package:flutter/material.dart';
import 'package:mobile_appraisal/core/components/components.dart';
import 'package:mobile_appraisal/core/constants/colors.dart';

Future<void> showBottomDialog({
  required BuildContext context,
  required Widget child,
  double heightFactor = 0.6,
}) async {
  await showModalBottomSheet<void>(
    context: context,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 1,
    enableDrag: true,
    isScrollControlled: true,
    backgroundColor: AppColors.primary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: heightFactor,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: 50.0,
                    height: 5.0, // Tinggi baris
                    color: Colors.grey[300], // Warna garis
                  ),
                ),
                const SpaceHeight(30),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}