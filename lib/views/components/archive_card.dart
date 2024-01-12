import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/archive_view.dart';
import 'package:pocket_tasks/views/components/priority_chip.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/utils/audio_manager.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';

class ArchiveCard extends StatefulWidget {
  final VoidCallback onTaskUpdated;
  const ArchiveCard({super.key, required this.onTaskUpdated});

  @override
  State<ArchiveCard> createState() => _ArchiveCardState();
}

class _ArchiveCardState extends State<ArchiveCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16.0),
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 0,
      child: InkWell(
        onTap: () {
          AudioManager.playFromName('tap.wav');
          Navigator.of(context).push(
              CustomPageRoute(
                ArchiveView(
                  onTaskUpdated: () {
                    widget.onTaskUpdated();
                  },
                )
              )
          );
        },
        borderRadius: BorderRadius.circular(16.0),
        splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                            Icons.inventory_2_rounded,
                            size: 24.0,
                        ),
                      )
                    ),
                    HorizontalSpacing(16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.archivedTask,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          VerticalSpacing(4.0),
                          Text(
                            AppLocalizations.of(context)!.archivedTaskDescription,
                            style: Theme.of(context).textTheme.labelSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
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
    );
  }
}
