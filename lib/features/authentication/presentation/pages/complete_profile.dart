import 'dart:async';

import 'package:ardilla/app/app.dart';
import 'package:ardilla/core/core.dart';
import 'package:ardilla/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _inviteCodeController = TextEditingController();
  final _passwordController = TextEditingController();

  final _userNameFocus = FocusNode();
  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _inviteCodeFocus = FocusNode();
  final _passwordFocus = FocusNode();

  late StreamController<String> _userNameStreamController;
  late StreamController<String> _firstNameStreamController;
  late StreamController<String> _lastNameStreamController;
  late StreamController<String> _phoneStreamController;
  late StreamController<String> _inviteCodeStreamController;
  late StreamController<String> _passwordStreamController;

  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  @override
  void initState() {
    _userNameStreamController = StreamController<String>.broadcast();
    _firstNameStreamController = StreamController<String>.broadcast();
    _lastNameStreamController = StreamController<String>.broadcast();
    _phoneStreamController = StreamController<String>.broadcast();
    _inviteCodeStreamController = StreamController<String>.broadcast();
    _passwordStreamController = StreamController<String>.broadcast();

    _userNameController.addListener(() {
      _userNameStreamController.sink.add(
        _userNameController.text.trim(),
      );
      validateInputs();
    });

    _firstNameController.addListener(() {
      _firstNameStreamController.sink.add(
        _firstNameController.text.trim(),
      );
      validateInputs();
    });

    _lastNameController.addListener(() {
      _lastNameStreamController.sink.add(
        _lastNameController.text.trim(),
      );
      validateInputs();
    });

    _phoneController.addListener(() {
      _phoneStreamController.sink.add(
        _phoneController.text.trim(),
      );
      validateInputs();
    });

    _inviteCodeController.addListener(() {
      _inviteCodeStreamController.sink.add(
        _inviteCodeController.text.trim(),
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

    final userNameError = CustomFormValidation.errorMessageUserName(
      _userNameController.text.trim(),
      'Username is required',
    );

    final firstNameError = CustomFormValidation.errorMessage(
      _firstNameController.text.trim(),
      'First Name is required',
    );
    final lastNameError = CustomFormValidation.errorMessage(
      _lastNameController.text.trim(),
      'Last Name is required',
    );

    final phoneError = CustomFormValidation.errorMessage(
      _phoneController.text.trim(),
      'Phone is required',
    );

    final passwordError = CustomFormValidation.errorMessagePassword(
      _passwordController.text.trim(),
      'Phone is required',
    );

    if (userNameError != '' ||
        firstNameError != '' ||
        lastNameError != '' ||
        phoneError != '' ||
        passwordError != '') {
      canSumit = false;
    }
    _canSubmit.value = canSumit;
  }

  @override
  void dispose() {
    _userNameStreamController.close();
    _firstNameStreamController.close();
    _lastNameStreamController.close();
    _phoneStreamController.close();
    _inviteCodeStreamController.close();
    _passwordStreamController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 34,
          ),
          child: Column(
            children: [
              const Gap(24.53),
              HeaderText(
                'Complete your profile',
                color: AppColors.darkPurple,
              ),
              const Gap(33),
              StreamBuilder<String>(
                stream: _userNameStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    prefix: Row(
                      children: [
                        SvgPicture.asset(AppAssets.mail),
                        const Gap(10),
                      ],
                    ),
                    controller: _userNameController,
                    placeholder: 'Username',
                    validationMessage:
                        CustomFormValidation.errorMessageUserName(
                      snapshot.data,
                      'Username is required*',
                    ),
                    validationColor: CustomFormValidation.getColor(
                      snapshot.data,
                      _userNameFocus,
                      CustomFormValidation.errorMessageUserName(
                        snapshot.data,
                        'Username is required*',
                      ),
                    ),
                  );
                },
              ),
              const Gap(10),
              StreamBuilder<String>(
                stream: _firstNameStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    prefix: Row(
                      children: [
                        SvgPicture.asset(AppAssets.mail),
                        const Gap(10),
                      ],
                    ),
                    controller: _firstNameController,
                    placeholder: 'First Name',
                    validationMessage: CustomFormValidation.errorMessage(
                      snapshot.data,
                      'First Name is required*',
                    ),
                    validationColor: CustomFormValidation.getColor(
                      snapshot.data,
                      _firstNameFocus,
                      CustomFormValidation.errorMessage(
                        snapshot.data,
                        'First Name is required*',
                      ),
                    ),
                  );
                },
              ),
              const Gap(10),
              StreamBuilder<String>(
                stream: _lastNameStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    prefix: Row(
                      children: [
                        SvgPicture.asset(AppAssets.mail),
                        const Gap(10),
                      ],
                    ),
                    controller: _lastNameController,
                    placeholder: 'Last Name',
                    validationMessage: CustomFormValidation.errorMessage(
                      snapshot.data,
                      'Last Name is required*',
                    ),
                    validationColor: CustomFormValidation.getColor(
                      snapshot.data,
                      _lastNameFocus,
                      CustomFormValidation.errorMessage(
                        snapshot.data,
                        'Last Name is required*',
                      ),
                    ),
                  );
                },
              ),
              const Gap(10),
              StreamBuilder<String>(
                stream: _phoneStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    prefix: Row(
                      children: [
                        SvgPicture.asset(AppAssets.mail),
                        const Gap(10),
                      ],
                    ),
                    controller: _phoneController,
                    placeholder: 'Phone Number',
                    validationMessage: CustomFormValidation.errorMessage(
                      snapshot.data,
                      'Phone Number is required*',
                    ),
                    validationColor: CustomFormValidation.getColor(
                      snapshot.data,
                      _phoneFocus,
                      CustomFormValidation.errorMessage(
                        snapshot.data,
                        'Phone Number is required*',
                      ),
                    ),
                  );
                },
              ),
              const Gap(10),
              StreamBuilder<String>(
                stream: _inviteCodeStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    prefix: Row(
                      children: [
                        SvgPicture.asset(AppAssets.mail),
                        const Gap(10),
                      ],
                    ),
                    controller: _inviteCodeController,
                    placeholder: 'Invite code (optional)',
                    validationMessage: CustomFormValidation.errorMessage(
                      snapshot.data,
                      '',
                    ),
                    validationColor: CustomFormValidation.getColor(
                      snapshot.data,
                      _inviteCodeFocus,
                      CustomFormValidation.errorMessage(
                        snapshot.data,
                        '',
                      ),
                    ),
                  );
                },
              ),
              const Gap(10),
              StreamBuilder<String>(
                stream: _passwordStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    prefix: Row(
                      children: [
                        SvgPicture.asset(AppAssets.mail),
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
              const Gap(30),
              const TandC(),
              const Gap(33),
              ValueListenableBuilder(
                valueListenable: _canSubmit,
                builder: (context, canSubmit, child) {
                  return BusyButton(
                    title: 'Create Account',
                    deactivate: !canSubmit,
                    onpress: () => Navigator.pushNamed(
                      context,
                      RouteName.verifyEmail,
                    ),
                  );
                },
              ),
              const Gap(33),
            ],
          ),
        ),
      ),
    );
  }
}
