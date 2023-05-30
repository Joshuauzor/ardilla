import 'package:ardilla/features/features.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(
          isActive: currentIndex == 0,
        ),
        const SizedBox(width: 1.75),
        Indicator(
          isActive: currentIndex == 1,
        ),
        const SizedBox(width: 1.75),
        Indicator(
          isActive: currentIndex == 2,
        ),
      ],
    );
  }
}
