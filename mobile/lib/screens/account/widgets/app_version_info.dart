import 'package:flutter/material.dart';

class AppVersionInfo extends StatelessWidget {
  const AppVersionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Version 1.0.0 (1)', // TODO: Get actual version and build number
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
