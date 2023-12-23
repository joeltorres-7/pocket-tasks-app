import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/components/primary_button.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:pocket_tasks/views/utils/database_manager.dart';

class AddTaskView extends StatefulWidget {
  final Function() onTaskAdded;
  const AddTaskView({super.key, required this.onTaskAdded});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String selectedPriority = 'high';
  bool validTask = false;

  void _saveNewTask() async {
    DatabaseHelper dbHelper = DatabaseHelper();

    try {
      await dbHelper.insertTask({
        'priority': selectedPriority,
        'title': titleController.text,
        'description': descriptionController.text,
      });

      widget.onTaskAdded();

      deactivate();
      Navigator.of(context).pop();
    } catch (err) {
      log("Error while saving new task: ${err}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.addTask,
          style: AppTextStyles.headingNav,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text(AppLocalizations.of(context)!.whatDoingToday, textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFormField(
                  controller: titleController,
                  textAlign:  TextAlign.center,
                  style: AppTextStyles.heading1,
                  onChanged: (inputValue) {
                    setState(() {
                      validTask = titleController.text.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                    hintText: AppLocalizations.of(context)!.taskTitle,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFormField(
                  controller: descriptionController,
                  textAlign:  TextAlign.center,
                  style: AppTextStyles.subheading1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                    hintText: AppLocalizations.of(context)!.taskDescription,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              VerticalSpacing(16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: const Color(0xFFD9D9D9)),
                  ),
                  child: DropdownButton<String>(
                    value: selectedPriority,
                    isExpanded: false,
                    isDense: true,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    iconSize: 24.0,
                    elevation: 4,
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    items: [
                      DropdownMenuItem(
                          value: 'high',
                          child: Row(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    color: AppColors.primaryRed,
                                    borderRadius: BorderRadius.circular(16.0)
                                ),
                                child: const SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                ),
                              ),
                              HorizontalSpacing(8.0),
                              Text(
                                AppLocalizations.of(context)!.highPriority,
                                style: AppTextStyles.regularMedium14,
                              ),
                            ],
                          )
                      ),
                      DropdownMenuItem(
                        value: 'medium',
                        child: Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue,
                                borderRadius: BorderRadius.circular(16.0)
                              ),
                              child: const SizedBox(
                                width: 12.0,
                                height: 12.0,
                              ),
                            ),
                            HorizontalSpacing(8.0),
                            Text(
                              AppLocalizations.of(context)!.mediumPriority,
                              style: AppTextStyles.regularMedium14,
                            ),
                          ],
                        )
                      ),
                      DropdownMenuItem(
                          value: 'low',
                          child: Row(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    color: AppColors.primaryGray,
                                    borderRadius: BorderRadius.circular(16.0)
                                ),
                                child: const SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                ),
                              ),
                              HorizontalSpacing(8.0),
                              Text(
                                AppLocalizations.of(context)!.lowPriority,
                                style: AppTextStyles.regularMedium14,
                              ),
                            ],
                          )
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        selectedPriority = value!;
                      });
                    },
                  ),
                ),
              ),
              VerticalSpacing(16.0),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButton(
              buttonText: AppLocalizations.of(context)!.addNewTask,
              onButtonPressed: () {
                _saveNewTask();
              },
              isButtonEnabled: titleController.text.isNotEmpty,
            ),
          ),
        ],
      ),
    );
  }
}