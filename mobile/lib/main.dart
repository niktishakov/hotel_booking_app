import 'dart:async';

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_booking_app/core/core.dart';
import 'package:hotel_booking_app/core/extensions/extensions.dart';
import 'package:hotel_booking_app/navigation/hb.route_observer.dart';
import 'package:hotel_booking_app/screens/favourites/model/favourites_bloc.dart';
import 'package:hotel_booking_app/screens/overview/model/overview_cubit.dart';
import 'package:hotel_booking_app/services/vibration_service.dart';
import 'package:hotel_booking_app/utils/ai_scroll_behaviour.dart';
import 'package:hotel_booking_app/utils/logger_interceptor.dart';
import 'package:hotel_booking_app/utils/theme/export.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'navigation/router_service.dart';
import 'screens/material_app_overlay_notifier.dart';
import 'services/toast.service.dart';

part 'main.part.dart';

final screenNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final aiApp = await buildApp();
    runApp(aiApp);
  }, (error, stackTrace) {
    AiLogger("Dart").error("$error\nStack trace:\n$stackTrace");
  });
}

Future<Widget> buildApp() async {
  AiLogger.initialize(isReleaseMode: kReleaseMode);

  final secrets = await Secrets.create();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  await Hive.initFlutter();

  // Handle Flutter framework errors
  FlutterError.onError = (details) {
    FlutterError.presentError(details); // Optional: Show error in debug console
    AiLogger("Flutter").error("${details.exceptionAsString()}\nStack trace:\n${details.stack}");
  };

  await VibrationService.init();

  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
  ]);

  await RouterService.init();
  await ToastService.init();

  final overlayNotifier = MaterialAppOverlayNotifier();

  final dio = Dio(
    BaseOptions(
      baseUrl: secrets.serpApiBaseUrl,
      headers: {
        'X-API-KEY': secrets.serpApiKey,
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.addAll([LoggerInterceptor()]);
  final _restClient = RestClient(dio);
  final _hotelApi = HotelApiDataSourceImpl(_restClient);
  final _hotelRepo = HotelRepositoryImpl(_hotelApi);
  final _getHotelsUsecase = GetHotelsUsecase(_hotelRepo);

  final providers = [
    BlocProvider<OverviewCubit>(
      create: (context) => OverviewCubit(
        getHotels: _getHotelsUsecase,
      ),
    ),
    BlocProvider<FavouritesBloc>(
      create: (context) => FavouritesBloc(),
    ),
    ChangeNotifierProvider<HbThemeProvider>(
      create: (_) {
        return HbThemeProvider(
          ThemesHolder.findWhere(
            themeKey: 'main',
          ),
        );
      },
    ),
    ChangeNotifierProvider.value(value: overlayNotifier),
  ];

  return _HbApp(providers: providers);
}

class _HbApp extends StatefulWidget {
  const _HbApp({
    Key? key,
    required this.providers,
  }) : super(key: key);
  final List<SingleChildWidget> providers;

  @override
  State<_HbApp> createState() => __AIAppState();
}

class __AIAppState extends State<_HbApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: widget.providers,
      child: Listen<HbThemeProvider>(builder: (context) {
        return MaterialApp.router(
          key: screenNavigatorKey,
          debugShowCheckedModeBanner: false,
          routerConfig: RouterService.instance.router.config(
            navigatorObservers: () => [HbRouteObserver()],
          ),
          builder: (context, child) {
            FToastBuilder();

            return ScrollConfiguration(
              behavior: const AiScrollBehaviour(),
              child: _MaterialAppLevelOverlay(
                notifier: find<MaterialAppOverlayNotifier>(context),
                child: Overlay(
                  initialEntries: [
                    if (child != null)
                      OverlayEntry(
                        builder: (context) {
                          return MediaQuery(
                            data: context.mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
                            child: child,
                          );
                        },
                      ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
