import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/priority_chip.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String description;
  final String priority;
  final bool hasDescription;
  const TaskCard({super.key, required this.title, required this.hasDescription, required this.description, required this.priority});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFE5E8E9)),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: AppTextStyles.regularMedium14),
                      VerticalSpacing(4.0),
                      widget.hasDescription ? Text(widget.description, style: AppTextStyles.regular14) : Text(AppLocalizations.of(context)!.noDescription, style: AppTextStyles.regularGray14),
                    ],
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.all(AppColors.primaryBlue),
                    value: isChecked,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ],
              ),
              VerticalSpacing(12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriorityChip(priorityLevel: widget.priority),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward, size: 18.0, color: Colors.black38))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
