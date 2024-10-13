import 'package:flutter/material.dart';
import '.././General Widget/appbar_widget.dart';
import '.././General Widget/heading_text_widget.dart';
import '.././General Widget/number_heading_text_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppbarWidget("Privacy Policy", true),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "At Safa Cab, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and protect the information you provide when using our application."),
              HeadingTextWidget("Information We Collect"),
              NumberHeadingTextWidget("1. Personal Information:"),
              const Text(
                  "   When you register an account with Safa Cab, we may collect personal information such as your name, email address, phone number, and payment details."),
              NumberHeadingTextWidget("2. Location Information:"),
              const Text(
                  "   In order to provide our services, we may collect and process information about your location, including GPS data."),
              NumberHeadingTextWidget("3. Usage Information:"),
              const Text(
                  "   We may collect information about how you use our application, including the pages you visit, the features you use, and the actions you take."),
              HeadingTextWidget("How We Use Your Information"),
              NumberHeadingTextWidget("1. Providing Services:"),
              const Text(
                  "   We use the information we collect to provide you with the services you request, such as booking rides, purchasing packages, and processing payments."),
              NumberHeadingTextWidget("2. Improving Our Services:"),
              const Text(
                  "   We may use your information to analyze trends, track user behavior, and improve the functionality and user experience of our application."),
              NumberHeadingTextWidget("3. Usage Information:"),
              const Text(
                  "   We may use your contact information to send you updates, notifications, and marketing communications about our services."),
              HeadingTextWidget("Sharing Your Information"),
              const Text(
                  "We may share your information with third-party service providers who assist us in providing our services, processing payments, and managing our business operations. We may also disclose your information in response to legal requests or to protect the rights, property, or safety of Safa Cab, our users, or others."),
              HeadingTextWidget("Your Choices"),
              const Text(
                  "You have the right to access, update, and delete the personal information you provide to us. You can also choose to opt out of receiving marketing communications from us."),
              HeadingTextWidget("Security Measures"),
              const Text(
                  "We take the security of your personal information seriously and have implemented measures to protect it from unauthorized access, disclosure, alteration, or destruction."),
              HeadingTextWidget("Changes to this Policy"),
              const Text(
                  "We may update this Privacy Policy from time to time to reflect changes in our practices or to comply with legal requirements. We will notify you of any material changes to this policy by posting the updated version on our website or sending you a notification through the application."),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  "   By using the Safa Cab application, you consent to the collection, use, and sharing of your information as described in this Privacy Policy.")
            ],
          ),
        ),
      ),
    );
  }
}
