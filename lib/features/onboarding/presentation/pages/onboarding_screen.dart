import 'package:ardilla/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  void onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              const Gap(20),
              Flexible(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: onChangedFunction,
                  children: [
                    PageItem(
                      currentIndex: currentIndex,
                      illustration: AppAssets.oneMeansId,
                      text: TextBold(
                        'Lorem Ipsum Kip Antares Lorem',
                        color: AppColors.midnightBlue,
                      ),
                      description: TextBody(
                        'Lorem ipsum dolor sit amet consectetur. Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.',
                        color: AppColors.mainSub,
                        maxLines: 4,
                      ),
                    ),
                    PageItem(
                      currentIndex: currentIndex,
                      illustration: AppAssets.oneMeansId,
                      text: TextBold(
                        'Lorem Ipsum Kip Antares Lorem',
                        color: AppColors.midnightBlue,
                      ),
                      description: TextBody(
                        'Lorem ipsum dolor sit amet consectetur. Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.',
                        color: AppColors.mainSub,
                        maxLines: 4,
                      ),
                    ),
                    PageItem(
                      currentIndex: currentIndex,
                      illustration: AppAssets.oneMeansId,
                      text: TextBold(
                        'Lorem Ipsum Kip Antares Lorem',
                        color: AppColors.midnightBlue,
                      ),
                      description: TextBody(
                        'Lorem ipsum dolor sit amet consectetur. Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.',
                        color: AppColors.mainSub,
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
              ),
              StepIndicator(currentIndex: currentIndex),
              const Gap(56),
              // BusyButton(
              //   title: 'Create Account',
              //   onpress: () => Navigator.pushNamed(
              //     context,
              //     RouteName.signup,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  const PageItem({
    Key? key,
    required this.illustration,
    required this.text,
    required this.description,
    required this.currentIndex,
  }) : super(key: key);
  final String illustration;
  final Widget text;
  final Widget description;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SvgPicture.asset(illustration),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(24),
              text,
              const Gap(8),
              description,
              const Gap(45),
            ],
          ),
        ],
      ),
    );
  }
}
