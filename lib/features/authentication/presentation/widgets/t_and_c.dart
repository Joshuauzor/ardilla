import 'package:ardilla/core/core.dart';
import 'package:flutter/material.dart';

class TandC extends StatelessWidget {
  const TandC({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'By Signing Up , You’re agreeing to our ',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.cabinetGrotesk,
          color: AppColors.gray,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
          TextSpan(text: ' and'),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
