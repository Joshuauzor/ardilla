import 'package:ardilla/app/app.dart';
import 'package:ardilla/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: SecondaryAppBar(
        onTapTitle: () => _drawerKey.currentState?.openDrawer(),
        onTapLeading: () {},
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextRegular(
                  'Good Morning.',
                  color: AppColors.gray,
                  fontSize: 12,
                ),
                SvgPicture.asset(AppAssets.sun),
              ],
            ),
            const Gap(2),
            TextRegular(
              'Cadet <Annie/>',
              color: AppColors.darkPurple,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          width: screenWidth(context) / 1.6,
          child: const HomeMenuDrawer(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
