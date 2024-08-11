import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_clean/features/authentication/presentation/screens/login_screen.dart';
import 'package:riverpod_clean/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:riverpod_clean/features/splash/presentation/screens/splash_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: DashboardRoute.page),
      ];
}
