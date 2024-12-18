import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_booking_app/core/core.dart';
import 'package:hotel_booking_app/core/extensions/extensions.dart';
import 'package:hotel_booking_app/navigation/screen_names.dart';
import 'package:hotel_booking_app/screens/overview/model/overview_cubit.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OverviewCubit>().getHotels();
      Future.delayed(2.seconds, () {
        context.router.navigateNamed(ScreenNames.mainShell);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox.square(
          dimension: context.mediaQuery.size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: const HbAssetImage(HbAssets.logo, fit: BoxFit.cover),
          ),
        ).animate().shimmer(
              duration: 1.seconds,
            ),
      ),
    );
  }
}
