import 'package:ardilla/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> _pageSetup() async {
    final navigator = Navigator.of(context);

    Future.delayed(
      const Duration(seconds: 2),
      () =>
          // userResult.fold((l) {
          navigator.pushReplacementNamed(
        RouteName.onboardingView,
      ),
    );
  }

  @override
  void initState() {
    _pageSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(AppAssets.logo),
        ),
      ),
    );
  }
}
