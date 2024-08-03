import 'package:flutter/material.dart';

class CarbonFootprintPainter extends CustomPainter {
  final double carbonFootprint;
  final double maxFootprint;

  CarbonFootprintPainter(this.carbonFootprint, this.maxFootprint);

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2;
    Paint circlePaint = Paint()
      ..color = Colors.blue.shade50
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    Paint progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(radius, radius), radius, circlePaint);
    canvas.drawCircle(Offset(radius, radius), radius, borderPaint);

    double angle = 2 * 3.141592653589793 * (carbonFootprint / maxFootprint);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -3.141592653589793 / 2,
      angle,
      false,
      progressPaint,
    );

    TextSpan span = TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      text: '${(carbonFootprint).toStringAsFixed(1)}g CO2',
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    tp.paint(canvas, Offset(radius - tp.width / 2, radius - tp.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
