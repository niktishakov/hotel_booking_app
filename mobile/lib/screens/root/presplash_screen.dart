import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/context_extension.dart';

class PresplashScreen extends StatelessWidget {
  const PresplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFAFC),
      body: Center(
        child: Text(
          'Buenro Booking',
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw rectangle
    canvas.drawRect(Rect.fromLTWH(50, 20, 20, 40), paint);

    // Draw rotated rectangle
    canvas.save();
    canvas.translate(100, 40);
    canvas.rotate(-0.3);
    canvas.drawRect(Rect.fromLTWH(-10, -20, 20, 40), paint);
    canvas.restore();

    // Draw vertical line
    canvas.drawLine(Offset(150, 10), Offset(150, 70), paint);

    // Draw underline
    canvas.drawLine(Offset(20, 180), Offset(280, 180), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
