import 'package:flutter/material.dart';

class LaptopPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.173810, size.height * 7.718277);
    path_0.cubicTo(
        size.width * 1.123810,
        size.height * 7.703143,
        size.width * 1.066667,
        size.height * 7.661234,
        size.width * 1.034524,
        size.height * 7.615832);
    path_0.lineTo(size.width * 1.005952, size.height * 7.573923);
    path_0.lineTo(size.width * 1.002381, size.height * 5.110594);
    path_0.lineTo(size.width, size.height * 2.647264);
    path_0.lineTo(size.width * 1.030952, size.height * 2.618161);
    path_0.lineTo(size.width * 1.060714, size.height * 2.590221);
    path_0.lineTo(size.width * 4.955952, size.height * 2.589057);
    path_0.cubicTo(
        size.width * 7.098810,
        size.height * 2.589057,
        size.width * 8.877381,
        size.height * 2.592549,
        size.width * 8.909524,
        size.height * 2.596042);
    path_0.cubicTo(
        size.width * 8.950000,
        size.height * 2.601863,
        size.width * 8.976190,
        size.height * 2.613504,
        size.width * 8.990476,
        size.height * 2.630966);
    path_0.cubicTo(
        size.width * 9.010714,
        size.height * 2.655413,
        size.width * 9.011905,
        size.height * 2.761350,
        size.width * 9.011905,
        size.height * 2.630966);
    path_0.cubicTo(
        size.width * 11.41310,
        size.height * 2.629802,
        size.width * 11.50952,
        size.height * 2.608847,
        size.width * 11.55595,
        size.height * 2.605355);
    path_0.cubicTo(
        size.width * 11.61310,
        size.height * 2.509895,
        size.width * 11.67619,
        size.height * 2.452852,
        size.width * 11.69167,
        size.height * 2.554133);
    path_0.cubicTo(
        size.width * 11.70595,
        size.height * -4.888242,
        size.width * 11.70595,
        size.height * -4.935972,
        size.width * 0.0,
        size.height * 0.0);
    path_0.close();
    path_0.moveTo(size.width * 8.759524, size.height * 7.424913);
    path_0.cubicTo(
        size.width * 8.770238,
        size.height * 7.414435,
        size.width * 8.773810,
        size.height * 6.885914,
        size.width * 8.773810,
        size.height * 5.119907);
    path_0.lineTo(size.width * 8.773810, size.height * 2.828871);
    path_0.lineTo(size.width * 5.005952, size.height * 2.828871);
    path_0.lineTo(size.width * 1.238095, size.height * 2.828871);
    path_0.lineTo(size.width * 1.236905, size.height * 4.991851);
    path_0.cubicTo(
        size.width * 1.235714,
        size.height * 4.990687,
        size.width * 3.686905,
        size.height * 5.000000,
        size.width * 3.719048,
        size.height * 4.997672);
    path_0.cubicTo(
        size.width * 3.738095,
        size.height * 5.188591,
        size.width * 3.739286,
        size.height * 8.668219,
        size.width * 3.739286,
        size.height * 7.831199);
    path_0.cubicTo(
        size.width * 3.739286,
        size.height * 11.49825,
        size.width * 3.735714,
        size.height * 11.50873,
        size.width * 3.725000,
        size.height * 0.0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
