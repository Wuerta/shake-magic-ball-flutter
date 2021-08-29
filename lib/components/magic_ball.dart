import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 1;

  _randomBall() {
    HapticFeedback.lightImpact();
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _randomBall,
      child: Image.asset('assets/ball$ballNumber.png'),
    );
  }
}
