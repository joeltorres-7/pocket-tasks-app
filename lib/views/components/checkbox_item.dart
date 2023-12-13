import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class CheckboxItem extends StatefulWidget {
  final String label;
  final String description;
  final VoidCallback onSelection;

  const CheckboxItem({Key? key, required this.label, required this.description, required this.onSelection})
      : super(key: key);

  @override
  State<CheckboxItem> createState() => _CheckboxItemState();
}

class _CheckboxItemState extends State<CheckboxItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.only(top: 12.0, right: 24.0, bottom: 12.0, left: 24.0),
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
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
                widget.onSelection();
              },
            ),
          ],
        ),
      ),
    );
  }
}
