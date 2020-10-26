import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignDemo extends StatefulWidget {
  @override
  _AnimatedAlignDemoState createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  AlignmentGeometry alignment = Alignment.center;
  Duration animationDuration = Duration(milliseconds: 500);
  Color color = Colors.deepOrange;
  Curve animationCurve = Curves.easeInOutBack;

  AlignmentGeometry randomAlign() {
    Map boolToSign = {
      true: 1,
      false: -1,
    };
    double x = boolToSign[Random().nextBool()] * Random().nextDouble();
    double y = boolToSign[Random().nextBool()] * Random().nextDouble();
    return Alignment(x, y);
  }

  Color randomColor() {
    Map intToColor = {
      0: Colors.deepOrange,
      1: Colors.black,
      2: Colors.deepPurple,
      3: Colors.pink,
      4: Colors.teal,
      5: Colors.green[800],
      6: Colors.blueAccent,
    };
    return intToColor[Random().nextInt(7)];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // color: Colors.blueAccent,
          child: AnimatedAlign(
            duration: animationDuration,
            curve: animationCurve,
            alignment: alignment,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  alignment = randomAlign();
                  color = randomColor();
                });
              },
              child: Card(
                elevation: 10.0,
                shape: CircleBorder(),
                child: AnimatedContainer(
                  curve: animationCurve,
                  duration: animationDuration,
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('PRESS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
