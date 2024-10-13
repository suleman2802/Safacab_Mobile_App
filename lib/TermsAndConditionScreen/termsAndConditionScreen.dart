import 'package:flutter/material.dart';
import '.././General Widget/appbar_widget.dart';
import '.././General Widget/number_heading_text_widget.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppbarWidget("Terms & Conditions", true),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Welcome to Safa Cab! These Terms and Conditions govern your use of the Safa Cab application and the services provided through it. By using our application, you agree to comply with these terms."),
              NumberHeadingTextWidget("1. User Account:"),
              const Text(
                  "   - You must be at least 18 years old to create an account with Safa Cab."),
              const Text(
                  "   - You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account."),
              NumberHeadingTextWidget("2. Booking Services"),
              const Text(
                  "   - Safa Cab provides a platform for users to book taxi rides, purchase packages, and access other transportation services."),
              const Text(
                  "   - By booking a ride or purchasing a package through our application, you agree to abide by the terms and conditions set forth by the service provider."),
              NumberHeadingTextWidget("3. Payment: "),
              const Text(
                  "   - You agree to pay all fees and charges associated with the services you request through the Safa Cab application."),
              NumberHeadingTextWidget("4. User Conduct"),
              const Text(
                  "   - You agree to use the Safa Cab application in accordance with all applicable laws and regulations."),
              const Text(
                  "   - You agree not to use the application for any unlawful or fraudulent purpose or to engage in any activities that may harm or interfere with the operation of the application."),
              NumberHeadingTextWidget("5. Limitation of Liability:"),
              const Text(
                  "   - Safa Cab is not liable for any damages, losses, or injuries arising out of or related to your use of the application or the services provided through it."),
              NumberHeadingTextWidget("6. Changes to Terms:"),
              const Text(
                  "- We reserve the right to update or modify these Terms and Conditions at any time without prior notice. Any changes will be effective immediately upon posting on our website or through the application."),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  "   By using the Safa Cab application, you agree to these Terms and Conditions. If you do not agree with any part of these terms, you should not use the application.")
            ],
          ),
        ),
      ),
    );
  }
}
