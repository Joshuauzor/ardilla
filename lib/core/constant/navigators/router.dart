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

    case RouteName.verifyEmail:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const VerifyEmail(),
      );

    case RouteName.completeProfile:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const CompleteProfileView(),
      );

    case RouteName.signInView:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SignInView(),
      );

    case RouteName.homeView:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const HomeView(),
      );

    case RouteName.appTabView:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const AppTabView(),
      );

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
