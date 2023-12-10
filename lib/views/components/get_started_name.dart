import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetStartedName extends StatefulWidget {
  const GetStartedName({super.key});

  @override
  State<GetStartedName> createState() => _GetStartedNameState();
}

class _GetStartedNameState extends State<GetStartedName> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textFieldController = TextEditingController();

  String _data = '';

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  void _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _data = prefs.getString('userName') ?? '';
    });
  }

  void _saveName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', value);
  }

  void saveData(String value) async {
    if (_formKey.currentState!.validate()) {
      _saveName(_textFieldController.text);
      _loadName();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Text(AppLocalizations.of(context)!.yourName, style: AppTextStyles.regular),
        Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  textAlign:  TextAlign.center,
                  controller: _textFieldController,
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
                // ElevatedButton(
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       _saveData(_textFieldController.text);
                //       _loadData();
                //     }
                //   },
                //   child: Text('Save Data'),
                // ),
              ],
            ),
        )
      ]
    );
  }
}
