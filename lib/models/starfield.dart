import 'star.dart';

class Starfield {
  int nStars;
  double width, height;
  double originX, originY;

  List<Star> stars;

  void init({int totalStars, double w, double h}) {
    nStars = totalStars;
    width = w;
    height = h;
    originX = w / 2;
    originY = h / 2;
    stars = List<Star>();

    for (var i = 0; i < nStars; i++) {
      stars.add(Star(width, height));
      stars[i].transform(originX, originY);
    }
  }

  void update() {
    for (var star in stars) {
      star.move();
      star.transform(originX, originY);
    }
  }
}