import 'package:flutter/material.dart';
import 'package:shake_ball_magic/screens/home_screen.dart';

void main() => runApp(const ShakeBallMagic());

class ShakeBallMagic extends StatelessWidget {
  const ShakeBallMagic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
