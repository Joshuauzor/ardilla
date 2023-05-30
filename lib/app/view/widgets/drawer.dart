import 'package:ardilla/app/app.dart';
import 'package:ardilla/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeMenuDrawer extends StatelessWidget {
  const HomeMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        bottom: false,
        child: Container(
          color: AppColors.primaryColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppAssets.avatar,
                        height: 51,
                        width: 51,
                      ),
                      const Gap(15),
                      TextRegular(
                        'Joshua Uzor',
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.51,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 38, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DrawerListItem(
                        title: 'Profile',
                        image: AppAssets.profile,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      DrawerListItem(
                        title: 'Portfolio',
                        image: AppAssets.learn,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      DrawerListItem(
                        title: 'Payment',
                        image: AppAssets.payment,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      DrawerListItem(
                        title: 'Investment',
                        image: AppAssets.investment,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      DrawerListItem(
                        title: 'Insurance',
                        image: AppAssets.insurance,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      DrawerListItem(
                        title: 'Budgeting',
                        image: AppAssets.budgeting,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Gap(screenHeight(context) * 0.04),
                      DrawerListItem(
                        title: 'Log Out',
                        image: AppAssets.logout,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String image;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 35,
          child: Row(
            children: [
              SvgPicture.asset(
                image,
              ),
              const Gap(9.36),
              TextRegular(
                title,
                color: AppColors.white,
                fontSize: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
