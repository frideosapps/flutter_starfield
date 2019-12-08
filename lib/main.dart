import 'package:flutter/material.dart';

import 'starfield_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('assets/background.jpg'), context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),      
      home: LayoutBuilder(builder: (context, constraints) {
    
        return StarfieldExample(
            maxWidth: constraints.maxWidth, maxHeight: constraints.maxHeight);
      }),
    );
  }
}