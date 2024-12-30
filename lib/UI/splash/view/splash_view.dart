import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('Logo', style: TextStyle(fontSize: 30,
        color: Colors.red,
        fontWeight: FontWeight.bold
        ),),
      ),

    );
  }
}
