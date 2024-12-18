import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'widgets/app_version_info.dart';
import 'widgets/unauthorized_user_view.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              UnauthorizedUserView(),
              Spacer(),
              AppVersionInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
