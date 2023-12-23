import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckboxItem extends StatefulWidget {
  final String label;
  final String description;
  final VoidCallback onSelection;
  final String preferenceKey;

  const CheckboxItem({
    Key? key,
    required this.label,
    required this.description,
    required this.onSelection, required this.preferenceKey,
  }) : super(key: key);

  @override
  State<CheckboxItem> createState() => _CheckboxItemState();
}

class _CheckboxItemState extends State<CheckboxItem> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    // Load the initial state from SharedPreferences
    _loadState();
  }

  // Load the initial state from SharedPreferences
  Future<void> _loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isChecked = prefs.getBool(widget.preferenceKey) ?? false;
    });
  }

  // Save the state to SharedPreferences
  Future<void> _saveState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(widget.preferenceKey, value);
  }

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
              width: screenWidth * 0.64,
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
            Transform.scale(
              scale: 0.8,
              child: Switch(
                activeColor: Colors.white,
                activeTrackColor: Colors.black,
                inactiveTrackColor: const Color(0xFFEBECEE),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                  _saveState(value);
                  widget.onSelection();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
