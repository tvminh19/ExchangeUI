import 'package:exchange_machine/views/handle_screen.dart';
import 'package:exchange_machine/views/manual_confirm_screen.dart';
import 'package:exchange_machine/views/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_text.dart';
import 'confirm_screen.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  int _pin = 0;

  void _onKeyPressed(String key) {
    setState(() {
      _pin = _pin * 10 + int.parse(key);
    });
  }

  void _onClearKeyPressed() {
    setState(() {
      _pin = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            customText("Let's exchange your money!", fontSize: 40),
            Row(
              children: [
                Image.asset(
                  'assets/images/a.png',
                  height: 200,
                ),
                customText("\$1", fontSize: 40),
                const Spacer(),
                customText("=", fontSize: 50),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset(
                    'assets/images/v.png',
                    height: 150,
                  ),
                ),
                customText("22,500 VND", fontSize: 40)
              ],
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Image.asset(
                      'assets/images/v.png',
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 10),
                  customText(NumberFormat.decimalPattern().format(_pin * 22500),
                      fontSize: 40),
                  const Spacer(),
                  customText("=", fontSize: 50),
                  const Spacer(),
                  Image.asset(
                    'assets/images/a.png',
                    height: 50,
                  ),
                  customText(NumberFormat.decimalPattern().format(_pin),
                      fontSize: 40),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StartScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: null,
                  ),
                ),
                Spacer(),
                atmKeyboard(),
                SizedBox(width: 10),
                functionKeyboard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget functionKeyboard() {
    return Container(
      width: 100,
      height: 190,
      child: Column(
        children: [
          _buildKeyboardButton('Del', color: Colors.grey),
          _buildKeyboardButton('Clear', color: Colors.yellow),
          _buildKeyboardButton('Enter', color: Colors.green),
        ],
      ),
    );
  }

  Widget atmKeyboard() {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              _buildKeyboardButton('1'),
              _buildKeyboardButton('2'),
              _buildKeyboardButton('3'),
            ],
          ),
          Row(
            children: [
              _buildKeyboardButton('4'),
              _buildKeyboardButton('5'),
              _buildKeyboardButton('6'),
            ],
          ),
          Row(
            children: [
              _buildKeyboardButton('7'),
              _buildKeyboardButton('8'),
              _buildKeyboardButton('9'),
            ],
          ),
          Row(
            children: [
              _buildKeyboardButton('', color: Colors.grey),
              _buildKeyboardButton('0'),
              _buildKeyboardButton('', color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKeyboardButton(String label, {Color color = Colors.white}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          String signal = label.toLowerCase();
          if (signal == 'clear') {
            _onClearKeyPressed();
          } else if (signal == 'enter') {
            if (_pin == 0) {
              return;
            }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmScreen(
                  amount: _pin * 22500,
                ),
              ),
            );
          } else if (signal == 'del') {
            setState(() {
              _pin = (_pin / 10).floor();
            });
          } else {
            _onKeyPressed(label);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: color,
          ),
          child: Center(
            child: label == 'clear'
                ? Icon(Icons.backspace_outlined)
                : customText(label),
          ),
        ),
      ),
    );
  }
}
