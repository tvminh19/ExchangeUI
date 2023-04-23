import 'dart:async';

import 'package:exchange_machine/views/handle_screen.dart';
import 'package:exchange_machine/views/manual_confirm_screen.dart';
import 'package:exchange_machine/views/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:exchange_machine/widgets/custom_text.dart';

class DetectScreen extends StatefulWidget {
  const DetectScreen({Key? key}) : super(key: key);

  @override
  State<DetectScreen> createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => const ManualConfirmScreen())));
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
            customText("Detecting Currency ...", fontSize: 40),
            // phone icon
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
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
