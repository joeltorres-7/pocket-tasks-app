import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({Key? key}) : super(key: key);

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
              AppLocalizations.of(context)!.privacyLabel,
              style: AppTextStyles.headingNav,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // Privacy Policy Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.privacyPolicyTitle,
                      style: AppTextStyles.boldHeading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.lastUpdatedLabel,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.privacyPolicyText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.informationWeCollectLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.informationWeCollectText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.howWeUseYourInformationLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.howWeUseYourInformationText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.dataStorageLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.dataStorageText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.yourChoicesLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.yourChoicesText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.securityLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.securityText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.childrensPrivacyLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.childrensPrivacyText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.changesToPrivacyPolicyLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.changesToPrivacyPolicyText,
                      style: AppTextStyles.regularGray14,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      AppLocalizations.of(context)!.contactUsLabel,
                      style: AppTextStyles.boldSubheading,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      AppLocalizations.of(context)!.contactUsText,
                      style: AppTextStyles.regularGray14,
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
