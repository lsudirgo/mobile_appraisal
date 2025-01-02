import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis direction; // Horizontal or vertical
  final double dashWidth; // Width of each dash
  final double dashHeight; // Height of each dash
  final double dashSpacing; // Space between dashes
  final Color color; // Color of the dashes

  const DashedLine({
    super.key,
    this.direction = Axis.horizontal,
    this.dashWidth = 5.0,
    this.dashHeight = 1.0,
    this.dashSpacing = 3.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: direction == Axis.horizontal
          ? Size(double.infinity, dashHeight)
          : Size(dashHeight, double.infinity),
      painter: DashedLinePainter(
        direction: direction,
        dashWidth: dashWidth,
        dashHeight: dashHeight,
        dashSpacing: dashSpacing,
        color: color,
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Axis direction;
  final double dashWidth;
  final double dashHeight;
  final double dashSpacing;
  final Color color;

  DashedLinePainter({
    required this.direction,
    required this.dashWidth,
    required this.dashHeight,
    required this.dashSpacing,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = dashHeight;

    double start = 0.0;
    while (start < (direction == Axis.horizontal ? size.width : size.height)) {
      if (direction == Axis.horizontal) {
        canvas.drawLine(
          Offset(start, 0),
          Offset(start + dashWidth, 0),
          paint,
        );
      } else {
        canvas.drawLine(
          Offset(0, start),
          Offset(0, start + dashWidth),
          paint,
        );
      }
      start += dashWidth + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
