import 'dart:async';

import 'package:exchange_machine/views/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:exchange_machine/widgets/custom_text.dart';

class HandleScreen extends StatefulWidget {
  const HandleScreen({Key? key}) : super(key: key);

  @override
  State<HandleScreen> createState() => _HandleScreenState();
}

class _HandleScreenState extends State<HandleScreen> {
  int _secondsLeft = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsLeft--;
      });
      if (_secondsLeft == 0) {
        _timer.cancel();
        _showCompleteScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText("We are handling your request", fontSize: 40),
            SizedBox(height: 20),
            Icon(
              Icons.hourglass_bottom_rounded,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            customText("$_secondsLeft seconds left...", fontSize: 20),
          ],
        ),
      ),
    );
  }

  void _showCompleteScreen() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const StartScreen())));
        });
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_rounded,
                size: 100,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              customText("Handling complete!", fontSize: 30),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
