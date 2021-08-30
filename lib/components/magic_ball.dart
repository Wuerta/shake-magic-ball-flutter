import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shake/shake.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  late ShakeDetector detector;
  int ballNumber = 1;

  _randomBall() {
    HapticFeedback.vibrate();
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  void initState() {
    setState(() {
      detector = ShakeDetector.autoStart(onPhoneShake: _randomBall);
    });
    super.initState();
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _randomBall,
      child: Image.asset('assets/ball$ballNumber.png'),
    );
  }
}
