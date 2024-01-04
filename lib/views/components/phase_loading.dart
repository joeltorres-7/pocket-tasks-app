import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';

class PhaseLoading extends StatefulWidget {
  final String loadingText;
  final String descriptionText;
  final Icon loadingIcon;
  final bool rotateIcon;

  const PhaseLoading(
      {super.key,
      required this.loadingText,
      this.descriptionText = "",
      required this.loadingIcon,
      this.rotateIcon = false});

  @override
  State<PhaseLoading> createState() => _PhaseLoadingState();
}

class _PhaseLoadingState extends State<PhaseLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.rotateIcon) {
      _controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
      )..repeat();
    }
  }

  @override
  void dispose() {
    if (widget.rotateIcon) {
      _controller.dispose();
    }
    super.dispose();
  }

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
                widget.rotateIcon
                    ? RotationTransition(
                        turns: _controller,
                        child: widget.loadingIcon,
                      )
                    : widget.loadingIcon,
                VerticalSpacing(12.0),
                SizedBox(
                  width: screenWidth - (screenWidth * 0.4),
                  child: Column(
                    children: [
                      Text(
                        widget.loadingText,
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      (widget.descriptionText.isNotEmpty)
                          ? Container(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                widget.descriptionText,
                                style: Theme.of(context).textTheme.labelSmall,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : const SizedBox(),
                    ],
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
