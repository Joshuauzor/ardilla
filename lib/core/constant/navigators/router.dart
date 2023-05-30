// ignore_for_file: cast_nullable_to_non_nullable

import 'package:ardilla/core/core.dart';
import 'package:ardilla/features/features.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splash:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SplashView(),
      );

    case RouteName.onboardingView:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const OnboardingScreen(),
      );

    case RouteName.signUpView:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SignUpView(),
      );

    // case RouteName.reportActivity:
    //   final args = settings.arguments as ReportActivityParams;

    //   return _getPageRoute(
    //     routeName: settings.name!,
    //     viewToShow: ReportActivity(
    //       params: args,
    //     ),
    //   );

    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

Route<dynamic> _getPageRoute({
  required String routeName,
  required Widget viewToShow,
}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
