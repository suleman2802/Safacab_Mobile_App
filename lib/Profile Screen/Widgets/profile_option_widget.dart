import 'package:flutter/material.dart';
import '../../Routes/route_controller.dart';
import '../Widgets/help_and_support_dialogue.dart';
import './single_option_widget.dart';

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleOptionWidget(
          "Change Username",
          () => navigateToChangeUsernameScreen(context),
        ),
        const Divider(),
        SingleOptionWidget(
          "Change Password",
          () => navigateToChangePasswordScreen(context),
        ),
        const Divider(),
        SingleOptionWidget(
          "Change Phone Number",
          () => navigateToChangePhoneNumberScreen(context),
        ),
        const Divider(),
        SingleOptionWidget(
          "Help & Support",
          () => showAdaptiveDialog(
              context: context,
              builder: (context) {
                return const HelpAndSupportDialogue();
              }),
        ),
        const Divider(),
        SingleOptionWidget(
          "Privacy policy",
          () => navigateToPrivacyPolicyScreen(context),
        ),
        const Divider(),
        SingleOptionWidget(
          "Terms and Condition",
          () => navigateToTermsAndConditionScreen(context),
        ),
        // const Divider(),
        // SingleOptionWidget(
        //   "Delete Account",
        //   () => navigateToAuthenticationScreen(context),
        // ),
        const Divider(),
        SingleOptionWidget(
          "Logout",
          () => navigateToAuthenticationScreen(context),
        ),
        const Divider(),
      ],
    );
  }
}
