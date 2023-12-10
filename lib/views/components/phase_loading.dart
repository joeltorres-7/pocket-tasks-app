import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class PhaseLoading extends StatelessWidget {
  final String loadingText;
  final IconData loadingIcon;

  const PhaseLoading({Key? key, required this.loadingText, required this.loadingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(loadingIcon, size: 40.0),
                VerticalSpacing(12.0),
                SizedBox(
                  width: screenWidth - (screenWidth * 0.4),
                  child: Text(
                    loadingText,
                    style: AppTextStyles.heading1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
