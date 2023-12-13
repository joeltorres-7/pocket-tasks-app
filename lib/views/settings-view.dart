import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/checkbox_item.dart';
import 'package:pocket_tasks/views/components/option_item.dart';
import 'package:pocket_tasks/views/privacy_view.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/terms_view.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
              AppLocalizations.of(context)!.settingsTitle,
              style: AppTextStyles.headingNav,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // Items
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text(AppLocalizations.of(context)!.notificationsSection, textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              CheckboxItem(
                label: AppLocalizations.of(context)!.taskReminderLabel,
                description: AppLocalizations.of(context)!.taskReminderDescription,
                onSelection: () {},
                preferenceKey: 'enableTaskReminders',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text(AppLocalizations.of(context)!.experienceSection, textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              CheckboxItem(
                label: AppLocalizations.of(context)!.soundEffectsLabel,
                description: AppLocalizations.of(context)!.soundEffectsDescription,
                onSelection: (){},
                preferenceKey: 'enableSounds',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text(AppLocalizations.of(context)!.themesSection, textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              OptionItem(label: AppLocalizations.of(context)!.themeColorLabel, description: AppLocalizations.of(context)!.themeColorDescription, isClickable: true, onTap: (){}),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text(AppLocalizations.of(context)!.aboutSection, textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              OptionItem(label: AppLocalizations.of(context)!.versionLabel, description: AppLocalizations.of(context)!.versionDescription, isClickable: false, onTap: (){}),
              OptionItem(label: AppLocalizations.of(context)!.termsLabel, description: AppLocalizations.of(context)!.termsDescription, isClickable: true, onTap: (){
                Navigator.of(context).push(CustomPageRoute(const TermsView()));
              }),
              OptionItem(label: AppLocalizations.of(context)!.privacyPolicyLabel, description: AppLocalizations.of(context)!.privacyPolicyDescription, isClickable: true, onTap: (){
                Navigator.of(context).push(CustomPageRoute(const PrivacyView()));
              }),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text(AppLocalizations.of(context)!.otherSection, textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              OptionItem(label: AppLocalizations.of(context)!.deleteAccountLabel, description: AppLocalizations.of(context)!.deleteAccountDescription, isClickable: true, onTap: (){}),
              VerticalSpacing(16.0)
            ]),
          ),
        ],
      ),
    );
  }
}
