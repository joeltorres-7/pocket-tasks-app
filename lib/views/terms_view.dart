import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/privacy_view.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            elevation: 4,
            shadowColor: Colors.grey[100]!,
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0.4,
            title: Text(
              AppLocalizations.of(context)!.termsLabel,
              style: AppTextStyles.headingNav,
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
                      style: AppTextStyles.boldHeading,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        AppLocalizations.of(context)!.lastUpdatedLabel,
                        style: AppTextStyles.smallLabel,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.termsText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.useOfAppLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.useText1,
                      style: AppTextStyles.regularGray14,
                    ),
                    Text(
                      AppLocalizations.of(context)!.useText2,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.userContentLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.userContentText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.privacyLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.privacyText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.intellectualPropertyLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.intellectualPropertyText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.prohibitedActivitiesLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.prohibitedText1,
                      style: AppTextStyles.regularGray14,
                    ),
                    Text(
                      AppLocalizations.of(context)!.prohibitedText2,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.limitationOfLiabilityLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.liabilityText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.changesToTermsLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.changesToTermsText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.terminationLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.terminationText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.governingLawLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.governingLawText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
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
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.contactUsLabel,
                      style: AppTextStyles.boldSubheading,
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
    );
  }
}
