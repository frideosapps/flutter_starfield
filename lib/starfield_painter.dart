import 'package:flutter/material.dart';

import 'models/star.dart';

class StarfieldPainter extends CustomPainter {
  StarfieldPainter({this.stars, this.anim});

  final List<Star> stars;
  final double anim;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    for (int i = 0; i < 50; i++) {
      paint.color = Color.fromRGBO(225 - stars[i].z.toInt(),
          255 - stars[i].z.toInt(), anim.toInt(), 1.0);
      canvas.drawCircle(
          Offset(stars[i].px, stars[i].py), stars[i].size + 8 / anim, paint);
    }

    for (int i = 50; i < 100; i++) {
      paint.color = Color.fromRGBO(225,
          255 - stars[i].z.toInt(), anim.toInt(), 1.0);
      canvas.drawCircle(
          Offset(stars[i].px, stars[i].py), stars[i].size + 4 / anim, paint);
    }

    for (int i = 100; i < 150; i++) {
      paint.color = Color.fromRGBO(225,
          255 - stars[i].z.toInt(), 230, 1.0);
      canvas.drawCircle(
          Offset(stars[i].px, stars[i].py), stars[i].size + 6 / anim, paint);
    }

    for (int i = 150; i < stars.length - 1; i++) {
      paint.color = Color.fromRGBO(255 - stars[i].z.toInt(),
          255 - stars[i].z.toInt(), 255 - stars[i].z.toInt(), 1.0);

      canvas.drawCircle(Offset(stars[i].px, stars[i].py), stars[i].size, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
