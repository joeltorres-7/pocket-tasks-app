import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class OptionItem extends StatefulWidget {
  final String label;
  final String description;
  final bool isClickable;
  final VoidCallback onTap;

  const OptionItem({Key? key, required this.label, required this.description, required this.isClickable, required this.onTap})
      : super(key: key);

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 24.0, bottom: 12.0, left: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenWidth * 0.72,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style: AppTextStyles.regularMedium14,
                    maxLines: 1,
                  ),
                  Text(
                    widget.description,
                    style: AppTextStyles.regularGray14,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (widget.isClickable) ... [
              IconButton(
                onPressed: widget.onTap,
                icon: const Icon(Icons.keyboard_arrow_right_rounded),
              )
            ]
          ],
        ),
      ),
    );
  }
}
