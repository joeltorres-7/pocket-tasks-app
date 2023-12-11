import 'package:flutter/material.dart';
import 'package:pocket_tasks/models/UserData.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class GetStartedName extends StatelessWidget {
  final UserData userData;
  final ValueChanged<String> onNameChanged;

  GetStartedName({required this.userData, required this.onNameChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Text(AppLocalizations.of(context)!.yourName, style: AppTextStyles.regular),
        TextFormField(
          textAlign:  TextAlign.center,
          onChanged: onNameChanged,
          style: AppTextStyles.heading1,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.yourNameHint,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ]
    );
  }
}
