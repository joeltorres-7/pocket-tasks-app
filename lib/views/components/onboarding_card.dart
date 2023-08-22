import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/slider_dots.dart';

import '../styles/spaces.dart';
import '../styles/text_styles.dart';

class OnboardingCard extends StatelessWidget {
  final int currentIndex;
  final List<Map<String, String>> items;
  final VoidCallback onNextPressed;

  const OnboardingCard({super.key, required this.onNextPressed, required this.currentIndex, required this.items});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: 32.0,
            right: 24.0,
            bottom: 32.0,
            left: 24.0
        ),
        child: SizedBox(
          height: screenHeight / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${items[currentIndex]['title']}',
                      style: AppTextStyles.heading1,
                      textAlign: TextAlign.start,
                    ),
                    VerticalSpacing(8.0),
                    Text(
                      '${items[currentIndex]['subtitle']}',
                      style: AppTextStyles.subheading1,
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SliderDots(
                      dotNumber: 4,
                      currentDot: currentIndex,
                  ),
                  GestureDetector(
                    onTap: onNextPressed,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFEDEDED),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.arrow_forward),
                        ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),);
  }
}
