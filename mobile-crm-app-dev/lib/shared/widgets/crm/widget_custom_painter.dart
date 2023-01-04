import 'dart:math';

import 'package:flutter/material.dart';

class WidgetCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //left: 2, middle: 3, right: 2
    double middleRatio = 3 / 7;
    double sideRatio = 2 / 7;

    Paint leftPaint = Paint()..color = Colors.green;
    final Path leftPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * sideRatio - 8, 0)
      ..lineTo(size.width * sideRatio + 8, size.height / 2)
      ..lineTo(size.width * sideRatio - 8, size.height)
      ..lineTo(25, size.height)
      ..arcToPoint(
        Offset(0, size.height / 2),
        radius: const Radius.circular(26),
      )
      ..arcToPoint(
        const Offset(25, 0),
        radius: const Radius.circular(26),
      )
      ..close();
    canvas.drawPath(leftPath, leftPaint);

    Paint middlePaint = Paint()..color = Color.fromARGB(255, 7, 48, 83);
    Path middlePath = Path()
      ..moveTo(size.width * sideRatio, 0)
      ..lineTo(size.width * (middleRatio + sideRatio) - 8, 0)
      ..lineTo(size.width * (middleRatio + sideRatio) + 8, size.height / 2)
      ..lineTo(size.width * (middleRatio + sideRatio) - 8, size.height)
      ..lineTo(size.width * sideRatio, size.height)
      ..lineTo(size.width * sideRatio + 16, size.height / 2)
      ..close();
    canvas.drawPath(middlePath, middlePaint);

    Paint rightPaint = Paint()..color = Colors.grey;
    Path rightPath = Path()
      ..moveTo(size.width * (sideRatio + middleRatio), 0)
      ..lineTo(size.width - 25, 0)
      ..arcToPoint(
        Offset(size.width, size.height / 2),
        radius: const Radius.circular(26),
      )
      ..arcToPoint(
        Offset(size.width - 25, size.height),
        radius: const Radius.circular(26),
      )
      ..lineTo(size.width * (sideRatio + middleRatio), size.height)
      ..lineTo(size.width * (sideRatio + middleRatio) + 16, size.height / 2)
      ..close();
    canvas.drawPath(rightPath, rightPaint);
  }

  double degToRad(num deg) => deg * (pi / 180.0);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
