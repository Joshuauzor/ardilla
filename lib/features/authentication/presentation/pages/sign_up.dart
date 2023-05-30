import 'dart:async';

import 'package:ardilla/app/app.dart';
import 'package:ardilla/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _emailController = TextEditingController();

  final _emailFocus = FocusNode();

  late StreamController<String> _emailStreamController;

  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  @override
  void initState() {
    _emailStreamController = StreamController<String>.broadcast();

    _emailController.addListener(() {
      _emailStreamController.sink.add(
        _emailController.text.trim(),
      );
      validateInputs();
    });

    super.initState();
  }

  void validateInputs() {
    var canSumit = true;

    final emailError = CustomFormValidation.errorEmailMessage(
      _emailController.text.trim(),
      'Email Address is required',
    );

    if (emailError != '') {
      canSumit = false;
    }
    _canSubmit.value = canSumit;
  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
          ),
          Container(
            height: screenHeight(context) * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.signupBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(AppAssets.logoName),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.25,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(70),
                    HeaderText(
                      'Get Started',
                      color: AppColors.darkPurple,
                    ),
                    const Gap(12),
                    TextRegular(
                      'To Create an account enter a valid email address',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray,
                    ),
                    const Gap(35),
                    StreamBuilder<String>(
                      stream: _emailStreamController.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          prefix: Row(
                            children: [
                              SvgPicture.asset(AppAssets.mail),
                              const Gap(10),
                            ],
                          ),
                          controller: _emailController,
                          placeholder: 'Email address',
                          validationMessage:
                              CustomFormValidation.errorEmailMessage(
                            snapshot.data,
                            'Email address is required*',
                          ),
                          validationColor: CustomFormValidation.getColor(
                            snapshot.data,
                            _emailFocus,
                            CustomFormValidation.errorEmailMessage(
                              snapshot.data,
                              'Email address is required*',
                            ),
                          ),
                        );
                      },
                    ),
                    Gap(screenHeight(context) * 0.22),
                    ValueListenableBuilder(
                      valueListenable: _canSubmit,
                      builder: (context, canSubmit, child) {
                        return BusyButton(
                          title: 'Continue',
                          deactivate: !canSubmit,
                          onpress: () {},
                        );
                      },
                    ),
                    Gap(screenHeight(context) * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextRegular(
                          'Already have an account?',
                          fontSize: 12,
                          color: AppColors.gray,
                        ),
                        TextRegular(
                          ' Sign in',
                          fontSize: 12,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
