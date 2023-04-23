import 'dart:async';

import 'package:exchange_machine/views/handle_screen.dart';
import 'package:exchange_machine/views/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:exchange_machine/widgets/custom_text.dart';

class TakeoutScreen extends StatefulWidget {
  const TakeoutScreen({Key? key}) : super(key: key);

  @override
  State<TakeoutScreen> createState() => _TakeoutScreenState();
}

class _TakeoutScreenState extends State<TakeoutScreen> {
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              bottom: 30,
              left: 30,
              child: Container(
                width: 500,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: null,
              ),
            ),
            Positioned(
              left: width / 2 - 230,
              top: 100,
              child: customText("Please take your card back", fontSize: 40),
            ),
            Positioned(
              left: width / 2,
              top: 200,
              child: Icon(Icons.check_circle, size: 100, color: Colors.green),
            ),
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
