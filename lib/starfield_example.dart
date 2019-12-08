import 'package:flutter/material.dart';

import 'package:frideos/frideos.dart';

import 'models/starfield.dart';

import 'starfield_painter.dart';

class StarfieldExample extends StatefulWidget {
  StarfieldExample({Key key, this.maxWidth, this.maxHeight}) : super(key: key);

  final double maxWidth, maxHeight;

  @override
  _StarfieldExampleState createState() => _StarfieldExampleState();
}

class _StarfieldExampleState extends State<StarfieldExample>
    with SingleTickerProviderStateMixin {
  CurvedTween<double> anim;

  double width, height;
  String buttonMsg = 'Click me';
  int counter = 0;

  final starfield = Starfield();

  @override
  void initState() {
    super.initState();

    starfield.init(totalStars: 1200, w: widget.maxWidth, h: widget.maxHeight);

    anim = CurvedTween<double>(
        duration: Duration(milliseconds: 3500),
        setState: setState,
        tickerProvider: this,
        begin: 10.0,
        end: 255.0,
        onAnimating: _onAnimating,
        curve: Curves.easeInCubic);

    anim.forward();
    width = widget.maxWidth;
    height = widget.maxHeight;
  }

  void _onAnimating(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      anim.reverse();
    }
    if (status == AnimationStatus.dismissed) {
      anim.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    starfield.update();

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage("assets/background.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Container(
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: CustomPaint(
                    painter: StarfieldPainter(
                        stars: starfield.stars, anim: anim.value),
                  ),
                ),
                Positioned(
                  left: starfield.stars[50].px,
                  top: starfield.stars[50].py,
                  height: height,
                  width: width,
                  child: GestureDetector(
                    child: Text('Click me!  $counter',
                        style: TextStyle(color: Colors.amber)),
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
