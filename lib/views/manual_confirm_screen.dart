import 'package:exchange_machine/views/start_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_btn.dart';
import '../widgets/custom_text.dart';
import 'handle_screen.dart';

class ManualConfirmScreen extends StatelessWidget {
  const ManualConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            customText("Let's Exchange!", fontSize: 40),
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
            customText("You'll Receive", fontSize: 40),
            customText("20,000 VND", fontSize: 80),
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StartScreen(),
                      ),
                    );
                  },
                  child: customButton("Cancel", 300, color: Colors.red),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HandleScreen(),
                      ),
                    );
                  },
                  child: customButton("OK", 300, color: Colors.green),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
