import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/primary_button.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class CustomModalWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onClose;
  final VoidCallback onButtonPressed;

  CustomModalWidget({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onClose,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      borderRadius: BorderRadius.circular(16.0),
      color: Colors.white,
      child: Container(
        width: screenWidth * 0.8,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/illustrations/new-dawn-illustration.png'),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.heading1,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            subtitle,
                            style: AppTextStyles.regularGray14,
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                      PrimaryButton(
                        onButtonPressed: onButtonPressed,
                        buttonText: buttonText,
                        isButtonEnabled: true,
                        hasPadding: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              right: 16,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Color(0x50CDCDCD),
                    borderRadius: BorderRadius.circular(12.0)
                ),
                child: IconButton(
                  onPressed: onClose,
                  icon: Icon(Icons.close),
                  padding: EdgeInsets.all(12.0),
                  constraints: BoxConstraints(),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}