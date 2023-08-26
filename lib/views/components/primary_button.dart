import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;

  const PrimaryButton({super.key, required this.buttonText, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded borders
            ),
            minimumSize: Size(screenWidth, 0),
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: onButtonPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white
            ),
          )
      ),
    );
  }
}
