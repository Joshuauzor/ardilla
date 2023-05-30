import 'package:ardilla/app/app.dart';
import 'package:ardilla/core/core.dart';
import 'package:ardilla/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
            horizontal: 26,
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
                      illustration: AppAssets.top,
                      text: HeaderText(
                        'Lorem Ipsum Kip Antares Lorem',
                        color: AppColors.darkPurple,
                      ),
                      description: TextRegular(
                        'Lorem itodjo dolor sit amet jsjsj. Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.',
                        color: AppColors.gray,
                        maxLines: 4,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    PageItem(
                      currentIndex: currentIndex,
                      illustration: AppAssets.top,
                      text: HeaderText(
                        'Lorem Hello Lorem',
                        color: AppColors.darkPurple,
                      ),
                      description: TextRegular(
                        'Lorem otpsbujfant consectetur. jdjud aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.',
                        color: AppColors.gray,
                        maxLines: 4,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    PageItem(
                      currentIndex: currentIndex,
                      illustration: AppAssets.top,
                      text: HeaderText(
                        'Lorem Hey Antares Lorem',
                        color: AppColors.darkPurple,
                      ),
                      description: TextRegular(
                        'Lorem hseeopd amet consectetur. Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.',
                        color: AppColors.gray,
                        maxLines: 4,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StepIndicator(currentIndex: currentIndex),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteName.signUpView,
                    ),
                    child: CircularPercentIndicator(
                      radius: 40,
                      lineWidth: 2,
                      percent: 0.3,
                      center: const CircularNextBtn(),
                      progressColor: AppColors.primaryColor,
                      backgroundColor: AppColors.circularBackground,
                    ),
                  )
                ],
              ),
              const Gap(56),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularNextBtn extends StatelessWidget {
  const CircularNextBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.25,
      width: 62.25,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
      ),
      child: Center(
        child: SvgPicture.asset(AppAssets.arrow),
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
            child: Image.asset(illustration),
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
