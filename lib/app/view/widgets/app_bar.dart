import 'package:ardilla/app/app.dart';
import 'package:ardilla/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// AppBar for home screen wth logo
class SecondaryAppBar extends StatelessWidget with PreferredSizeWidget {
  const SecondaryAppBar({
    Key? key,
    this.title,
    this.leading,
    this.titleColor = AppColors.black,
    this.onTapTitle,
    this.onTapLeading,
  }) : super(key: key);

  final Widget? title;
  final Color titleColor;
  final Widget? leading;
  final VoidCallback? onTapTitle;
  final Function()? onTapLeading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 24,
        ),
        child: GestureDetector(
          onTap: onTapTitle,
          child: Image.asset(
            AppAssets.avatar,
            height: 51,
            width: 51,
          ),
        ),
      ),
      backgroundColor: AppColors.primaryBg,
      title: title,
      centerTitle: false,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 24,
          ),
          child: GestureDetector(
            onTap: onTapLeading,
            child: SvgPicture.asset(
              AppAssets.notification,
            ),
          ),
        ),
      ],
    );
  }
}

// AppBar for other screen with a back button and optional title
class PrimaryAppBar extends StatelessWidget with PreferredSizeWidget {
  const PrimaryAppBar({
    Key? key,
    required this.title,
    this.fontSize = 24,
    this.leading,
    this.titleColor = AppColors.black,
    this.action,
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final Widget? leading;
  final Widget? action;
  final double fontSize;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      title: HeaderText(
        title,
        fontSize: fontSize,
        color: titleColor,
      ),
      actions: [
        if (action != null) action!,
      ],
      elevation: 0,
    );
  }
}
