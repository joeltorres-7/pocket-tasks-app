import 'package:flutter/material.dart';

class ProgressNav extends StatelessWidget {
  final double progressValue;

  const ProgressNav({super.key, required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24.0,
            )),
          ),
          SizedBox(
            width: 260.0,
            child: LinearProgressIndicator(
              value: progressValue,
              semanticsLabel: 'Onboarding progress indicator',
            ),
          ),
          Text('${progressValue.round()}%')
        ],
      ),
    );
  }
}
