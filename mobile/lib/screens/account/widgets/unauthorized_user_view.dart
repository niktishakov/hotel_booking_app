import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/theme/export.dart';

class UnauthorizedUserView extends StatelessWidget {
  const UnauthorizedUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.hbTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          CupertinoIcons.person_alt_circle,
          size: 64,
          color: Colors.grey,
        ),
        SizedBox(height: 16),
        Text(
          'Sign in to access your account',
          style: theme.body18,
        ),
        SizedBox(height: 24),
        FilledButton(
          onPressed: null,
          child: Text('Sign In', style: theme.body16M),
        ),
      ],
    );
  }
}
