import 'dart:async';

import 'package:exchange_machine/views/handle_screen.dart';
import 'package:exchange_machine/views/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:exchange_machine/widgets/custom_text.dart';

class QrWaitingScreen extends StatefulWidget {
  const QrWaitingScreen({Key? key}) : super(key: key);

  @override
  State<QrWaitingScreen> createState() => _QrWaitingScreenState();
}

class _QrWaitingScreenState extends State<QrWaitingScreen> {
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
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const HandleScreen())));
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
            customText("Please continue on your App", fontSize: 40),
            // phone icon
            const SizedBox(height: 20),
            const Icon(Icons.phone_android, size: 100),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
