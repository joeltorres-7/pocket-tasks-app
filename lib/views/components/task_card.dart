import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/priority_chip.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/utils/audio_manager.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String description;
  final String priority;
  final int isCompleted;
  final bool hasDescription;
  final VoidCallback onCardTap;
  final VoidCallback onChecked;
  const TaskCard({super.key, required this.title, required this.hasDescription, required this.description, required this.priority, required this.onCardTap, required this.onChecked, required this.isCompleted});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = (widget.isCompleted == 1);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      borderRadius: BorderRadius.circular(16.0),
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 8,
      child: InkWell(
        onTap: widget.onCardTap,
        borderRadius: BorderRadius.circular(16.0),
        splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: isChecked ? 0.5 : 1.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                widget.title,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                            ),
                            VerticalSpacing(4.0),
                            widget.hasDescription
                                ? Text(
                                widget.description,
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                            )
                                : Text(
                                AppLocalizations.of(context)!.noDescription,
                                style: Theme.of(context).textTheme.labelSmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        checkColor: AppColors.primaryWhite,
                        fillColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onSecondary),
                        value: isChecked,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                        onChanged: (bool? value) {
                          widget.onChecked();
                          setState(() {
                            if (!isChecked) {
                              AudioManager.playFromName('completed.wav');
                            }
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
                      IconButton(
                          onPressed: null,
                          icon: Opacity(
                            opacity: 0.6,
                            child: Icon(
                            Icons.arrow_forward_rounded, size: 18.0, color: Theme.of(context).colorScheme.inversePrimary),
                          )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
