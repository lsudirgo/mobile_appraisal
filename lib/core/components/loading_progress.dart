import 'package:flutter/material.dart';
import 'package:mobile_appraisal/core/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  final String message;

  const LoadingWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background hitam transparan
        const Opacity(
          opacity: 0.7,
          child: ModalBarrier(dismissible: false, color: AppColors.black),
        ),
        // Kontainer loading di tengah layar
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8.0),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon loading di kiri
                const CircularProgressIndicator(
                  color: AppColors.secondary,
                ),
                const SizedBox(width: 20.0),
                // Teks dinamis di kanan
                Expanded(
                  child: Text(
                    message,
                    style:
                        const TextStyle(fontSize: 16.0, color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
