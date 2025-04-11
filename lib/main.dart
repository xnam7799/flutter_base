import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_ecommerce_app/app_config.dart';
import 'package:flutter_ecommerce_app/config/route/app_router.dart';
import 'package:flutter_ecommerce_app/config/styles/theme/custom_theme.dart';
import 'package:flutter_ecommerce_app/utils/constants.dart';
import 'package:flutter_ecommerce_app/views/widgets/common/lifecycle/app_lifecycle_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp();
      // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

      Function originalOnError = FlutterError.onError!;
      FlutterError.onError = (errorDetails) async {
        // await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
        originalOnError(errorDetails);
      };

      // TODOs: for test on emulator firebase, remove code when review, merged
      // FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8081);
      // FirebaseStorage.instance.useStorageEmulator("localhost", 9199);

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // Remote config
      // await RemoteConfig.instance.setConfigSettings(
      //   RemoteConfigSettings(
      //     fetchTimeout: const Duration(seconds: 10),
      //     minimumFetchInterval: Duration.zero,
      //   ),
      // );
      // RemoteConfigValue(null, ValueSource.valueStatic);

      // Get flavor
      AppConfig.flavor = await Constants.platformChannel.invokeMethod(
        Constants.getFlavor,
      );
      debugPrint('STARTED WITH FLAVOR ${AppConfig.flavor}');

      // Check load environment follow flavor
      if (AppConfig.flavor == Flavor.dev.name) {
        await dotenv.load(fileName: ".env_dev");
      } else if (AppConfig.flavor == Flavor.stg.name) {
        await dotenv.load(fileName: ".env_stg");
      } else if (AppConfig.flavor == Flavor.prod.name) {
        await dotenv.load(fileName: ".env_prod");
      }

      runApp(
        ProviderScope(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const MyApp(),
          ),
        ),
      );
    },
    (error, stackTrace) {
      // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return Stack(
      children: [
        AppAndScreenLifecycleDetector(
          context: context,
          resumedFunc: () async {
            // Reload when app go to background
            // https://stackoverflow.com/a/70445312
            AppConfig.isAppInBackground = false;
          },
          inactiveFunc: () {
            AppConfig.isAppInBackground = true;
          },
        ),
        ScreenUtilInit(
          designSize: const Size(375, 734),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: ((context, child) {
            return MaterialApp.router(
              title: "Flutter E-commerce App",
              theme: CustomTheme.createTheme(),
              debugShowCheckedModeBanner: false,
              routeInformationParser: router.defaultRouteParser(),
              routerDelegate: router.delegate(
                navigatorObservers:
                    () => [AutoRouteObserver(), NavigatorObserver()],
              ),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.linear(1.0)),
                  child: child ?? const SizedBox(),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

class NavigaterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint("Pushed route: ${route.settings.name}");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint("Popped route: ${route.settings.name}");
  }
}
