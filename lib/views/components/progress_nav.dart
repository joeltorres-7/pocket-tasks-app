import 'package:flutter/material.dart';

class ProgressNav extends StatelessWidget {
  final double progressValue;
  final VoidCallback onBackPressed;

  const ProgressNav({super.key, required this.progressValue, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: onBackPressed,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24.0,
            )),
          ),
          Flexible(
            child: LinearProgressIndicator(
              value: progressValue,
              semanticsLabel: 'Onboarding progress indicator',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Text('${(progressValue * 100).round()}%'),
          )
        ],
      ),
    );
  }
}
