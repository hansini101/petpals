import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';

void main() {
  runApp(const PaymentSuccessApp());
}

class PaymentSuccessApp extends StatelessWidget {
  const PaymentSuccessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentSuccessScreen(),
    );
  }
}

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onTabChange: (index) {
          // Handle tab change
        },
      ),
      body: Column(
        children: [
          Container(height: 60, color: Color(0xFFBAA35F)),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CustomPaint(painter: ConfettiPainter()),
                      ),
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: const Color(0xFFBAA35F),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Payment Successful!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBAA35F),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfettiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Color(0xFFBAA35F)
          ..style = PaintingStyle.fill;

    final randomOffsets = [
      const Offset(10, 10),
      const Offset(30, 20),
      const Offset(50, 30),
      const Offset(70, 10),
      const Offset(90, 40),
      const Offset(110, 20),
      const Offset(40, 60),
      const Offset(60, 90),
      const Offset(80, 70),
      const Offset(40, 60),
      const Offset(60, 90),
      const Offset(80, 70),
    ];

    for (var offset in randomOffsets) {
      canvas.drawCircle(offset, 7, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
