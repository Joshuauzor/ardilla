import 'dart:async';

import 'package:ardilla/app/app.dart';
import 'package:ardilla/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  late StreamController<String> _emailStreamController;
  late StreamController<String> _passwordStreamController;

  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  @override
  void initState() {
    _emailStreamController = StreamController<String>.broadcast();
    _passwordStreamController = StreamController<String>.broadcast();

    _emailController.addListener(() {
      _emailStreamController.sink.add(
        _emailController.text.trim(),
      );
      validateInputs();
    });

    _passwordController.addListener(() {
      _passwordStreamController.sink.add(
        _passwordController.text.trim(),
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

    final passwordError = CustomFormValidation.errorMessagePassword(
      _passwordController.text.trim(),
      'Phone is required',
    );

    if (emailError != '' || passwordError != '') {
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
            left: 17,
            right: 18,
            top: MediaQuery.of(context).size.height * 0.23,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.fiftyPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white,
                  ),
                  BoxShadow(
                    color: AppColors.zeroWhite,
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const SizedBox(
                height: 40,
              ),
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
                    Gap(screenHeight(context) * 0.04),
                    HeaderText(
                      'Welcome !',
                      color: AppColors.darkPurple,
                    ),
                    Gap(screenHeight(context) * 0.01),
                    TextRegular(
                      'Here’s how to Log in to access your account',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray,
                    ),
                    Gap(screenHeight(context) * 0.03),
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
                    Gap(screenHeight(context) * 0.01),
                    StreamBuilder<String>(
                      stream: _passwordStreamController.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          prefix: Row(
                            children: [
                              SvgPicture.asset(AppAssets.password),
                              const Gap(10),
                            ],
                          ),
                          controller: _passwordController,
                          placeholder: 'Password',
                          validationMessage:
                              CustomFormValidation.errorMessagePassword(
                            snapshot.data,
                            'Password is required*',
                          ),
                          validationColor: CustomFormValidation.getColor(
                            snapshot.data,
                            _passwordFocus,
                            CustomFormValidation.errorMessagePassword(
                              snapshot.data,
                              'Password is required*',
                            ),
                          ),
                        );
                      },
                    ),
                    Gap(screenHeight(context) * 0.01),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextRegular(
                        'Forgot Password?',
                        fontSize: 12,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Gap(screenHeight(context) * 0.03),
                    ValueListenableBuilder(
                      valueListenable: _canSubmit,
                      builder: (context, canSubmit, child) {
                        return BusyButton(
                          title: 'Continue',
                          deactivate: !canSubmit,
                          onpress: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteName.appTabView,
                            (route) => false,
                          ),
                        );
                      },
                    ),
                    Gap(screenHeight(context) * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 98,
                          child: Divider(),
                        ),
                        TextRegular(
                          ' Or ',
                          fontSize: 12,
                          color: AppColors.lightAsh,
                        ),
                        const SizedBox(
                          width: 98,
                          child: Divider(),
                        ),
                      ],
                    ),
                    Gap(screenHeight(context) * 0.03),
                    SecondaryBusyButton(
                      title: 'Sign in with SAN ID',
                      onpress: () {},
                    ),
                    Gap(screenHeight(context) * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextRegular(
                          'New user? ',
                          fontSize: 12,
                          color: AppColors.gray,
                        ),
                        TextRegular(
                          'Create Account',
                          fontSize: 12,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    Gap(screenHeight(context) * 0.03),
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
