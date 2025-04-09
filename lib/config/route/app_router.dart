import 'package:auto_route/auto_route.dart';
import 'package:flutter_ecommerce_app/config/route/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'provider.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
  ];
}
