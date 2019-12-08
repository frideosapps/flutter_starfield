import 'dart:math' as math;

class Star {
  Star(double width, double height) {
    final rnd = math.Random();
    velocity = 0.3 + rnd.nextDouble() * 0.1;

    final xMax = width * 25;
    final yMax = height * 25;

    x = (rnd.nextDouble() * xMax) - xMax / 2;
    y = (rnd.nextDouble() * yMax) - yMax / 2;
    z = rnd.nextDouble() * 200.0 + 20.0;
    size = 1.0;
  }

  double x;
  double y;
  double z;
  double velocity;
  double size;

  double px;
  double py;

  transform(double originX, double originY) {
    px = x / z * 2.0 + originX;
    py = y / z * 2.0 + originY;
  }

  move() {
    z -= velocity;

    if (z < 0.5) {
      final rnd = math.Random();
      z = rnd.nextDouble() * 200.0 + 20.0;
      size = 1;
    } else {
      size = 14 / z + 0.2;
    }
  }
}
