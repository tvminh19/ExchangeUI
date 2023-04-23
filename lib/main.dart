import 'package:exchange_machine/views/exchange_screen.dart';
import 'package:exchange_machine/views/manual_confirm_screen.dart';
import 'package:exchange_machine/views/qr_waiting_screen.dart';
import 'package:exchange_machine/views/start_screen.dart';
import 'package:exchange_machine/views/takeout_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartScreen(),
    );
  }
}
