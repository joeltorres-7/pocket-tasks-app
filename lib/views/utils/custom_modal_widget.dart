import 'package:flutter/material.dart';
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
    return Material(
      borderRadius: BorderRadius.circular(16.0),
      color: Colors.white,
      child: Container(
        width: 300, // Adjust the width as needed.
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onClose,
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.heading1,
                ),
                SizedBox(height: 10.0),
                Text(
                  subtitle,
                  style: AppTextStyles.regular14,
                ),
                SizedBox(height: 20.0),
              ],
            ),
            ElevatedButton(
              onPressed: onButtonPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}