import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Text(
                    AppLocalizations.of(context)!.getStartedIntro,
                    style: AppTextStyles.heading1,
                )
            )
        )
    );
  }
}
