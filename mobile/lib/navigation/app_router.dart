import 'package:auto_route/auto_route.dart';
import 'package:hotel_booking_app/screens/favourites/favourites_screen.dart';
import 'package:hotel_booking_app/screens/overview/overview_screen.dart';
import 'package:hotel_booking_app/screens/root/splash_screen.dart';

import '../screens/account/account_screen.dart';
import '../screens/main/main_shell.dart';
import 'screen_names.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: ScreenNames.splash,
          initial: true,
        ),

        // Shell route for bottom navigation
        AutoRoute(
          page: MainShellRoute.page,
          path: ScreenNames.mainShell,
          children: [
            AutoRoute(
              page: OverviewRoute.page,
              path: ScreenNames.overview,
            ),
            AutoRoute(
              page: FavoritesRoute.page,
              path: ScreenNames.favorites,
            ),
            AutoRoute(
              page: AccountRoute.page,
              path: ScreenNames.account,
            ),
          ],
        ),
      ];
}
