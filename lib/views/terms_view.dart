import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/privacy_view.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/utils/audio_manager.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              elevation: 4,
              shadowColor: Colors.grey[100]!,
              backgroundColor: Theme.of(context).colorScheme.background,
              scrolledUnderElevation: 0.4,
              title: Text(
                AppLocalizations.of(context)!.termsLabel,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  enableFeedback: false,
                  onPressed: () {
                    AudioManager.playFromName('back.wav');
                    Navigator.of(context).pop();
                  }
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.termsAndConditionsTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          AppLocalizations.of(context)!.lastUpdatedLabel,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.termsText,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.useOfAppLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      VerticalSpacing(8.0),
                      Text(
                        AppLocalizations.of(context)!.useText1,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        AppLocalizations.of(context)!.useText2,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.userContentLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      VerticalSpacing(8.0),
                      Text(
                        AppLocalizations.of(context)!.userContentText,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.privacyLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      VerticalSpacing(8.0),
                      Text(
                        AppLocalizations.of(context)!.privacyText,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.intellectualPropertyLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      VerticalSpacing(8.0),
                      Text(
                        AppLocalizations.of(context)!.intellectualPropertyText,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.prohibitedActivitiesLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      VerticalSpacing(8.0),
                      Text(
                        AppLocalizations.of(context)!.prohibitedText1,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        AppLocalizations.of(context)!.prohibitedText2,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.limitationOfLiabilityLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      VerticalSpacing(8.0),
                      Text(
                        AppLocalizations.of(context)!.liabilityText,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.changesToTermsLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      VerticalSpacing(8.0),
                      Text(
                        AppLocalizations.of(context)!.changesToTermsText,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.terminationLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      VerticalSpacing(8.0),
                      Text(
                        AppLocalizations.of(context)!.terminationText,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.governingLawLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      VerticalSpacing(8.0),
                      Text(
                        AppLocalizations.of(context)!.governingLawText,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      VerticalSpacing(16.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CustomPageRoute(const PrivacyView()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.privacyPolicyLabel,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.contactUsLabel,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle contact us action
                        },
                        child: Text(
                          AppLocalizations.of(context)!.contactEmail,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      VerticalSpacing(16.0)
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
