import 'package:ardilla/core/core.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.isActive,
    this.color = AppColors.primaryColor,
  }) : super(key: key);

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: isActive ? 29.17 : 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isActive ? color : AppColors.deactivatedPrimaryColor,
      ),
    );
  }
}
