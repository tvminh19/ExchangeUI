import 'package:exchange_machine/views/handle_screen.dart';
import 'package:exchange_machine/views/qr_waiting_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';
import 'detect_money_screen.dart';
import 'exchange_screen.dart';
import 'manual_confirm_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/mastercard.png',
                        height: 80,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/images/paypal.png',
                        height: 80,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/visa.png',
                    height: 80,
                  ),
                ],
              ),
            ),
            Positioned(top: 40, left: 50, child: customText("We support")),
            Positioned(
              top: 80,
              right: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const QrWaitingScreen();
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    customText("Payment QR"),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/qr.png',
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ExchangeScreen();
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/card.png',
                      height: 100,
                    ),
                    Image.asset(
                      'assets/images/nfc.png',
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 50,
              bottom: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DetectScreen();
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          customText("OR", color: Colors.white),
                          customText("JUST PUSH THE MONEY IN",
                              color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/arrow.png',
                          height: 100,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/images/arrow.png',
                          height: 100,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/images/arrow.png',
                          height: 100,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/images/arrow.png',
                          height: 100,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
