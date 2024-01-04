import 'package:flutter/material.dart';

class SliderDots extends StatelessWidget {
  final int dotNumber;
  final int currentDot;

  const SliderDots(
      {super.key, required this.dotNumber, required this.currentDot});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotNumber,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          width: index == currentDot ? 24.0 : 8.0,
          // Adjust the dot size as needed
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          // Adjust the spacing between dots
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: index == currentDot ? Theme.of(context).colorScheme.inversePrimary : Colors.grey,
          ),
        ),
      ),
    );
  }
}
