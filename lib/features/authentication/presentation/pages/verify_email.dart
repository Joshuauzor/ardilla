import 'package:ardilla/app/app.dart';
import 'package:ardilla/core/core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
        ),
        child: Column(
          children: [
            Gap(screenHeight(context) * 0.05),
            Image.asset(AppAssets.sendMail),
            Gap(screenHeight(context) * 0.05),
            TextRegular(
              'Verify your email address',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.darkPurple,
              textAlign: TextAlign.center,
            ),
            Gap(screenHeight(context) * 0.1),
            SecondaryBusyButton(
              title: 'Open Email App',
              onpress: () {},
            ),
            const Gap(26),
            BusyButton(
              title: 'Continue',
              onpress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
