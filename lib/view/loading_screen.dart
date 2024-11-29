import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final Widget nextScreen;

  LoadingScreen({required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => nextScreen),
      );
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
