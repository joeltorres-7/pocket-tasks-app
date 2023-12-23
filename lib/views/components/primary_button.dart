import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool hasPadding;
  final bool isButtonEnabled; // Add this

  const PrimaryButton({
    Key? key,
    required this.buttonText,
    required this.onButtonPressed,
    required this.isButtonEnabled,
    this.hasPadding = true, // Add this
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: hasPadding ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isButtonEnabled ? Colors.black : Colors.grey, // Adjust color based on enable/disable state
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: Size(screenWidth, 0),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: isButtonEnabled ? onButtonPressed : null, // Disable the button if not enabled
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
