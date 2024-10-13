import 'package:flutter/material.dart';
import 'package:safa_cab/Routes/route_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentDialogue extends StatefulWidget {
  double fare;
  String bookidId;

  PaymentDialogue(this.fare, this.bookidId);

  @override
  State<PaymentDialogue> createState() => _PaymentDialogueState();
}

class _PaymentDialogueState extends State<PaymentDialogue> {
  sendWhatsApp() async {
    final String message = 'Hello';
    final Uri url = Uri.parse(
        'https://wa.me/+966569764551?text=${Uri.encodeComponent(message)}');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
    // String message = "put your message";
    // String mobileNumber = "+966569764551";
    // final url = "whatsapp://send?phone=$mobileNumber&text=$message";
    // if (await canLaunchUrl(Uri.parse(Uri.encodeFull(url)))) {
    //   await launchUrl(Uri.parse(Uri.encodeFull(url)));
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  navigateToBookingScreeen() {
    navigateToBookingScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: sendWhatsApp,
          child: const Text("Send Whatsapp"),
        ),
        ElevatedButton(
          onPressed: navigateToBookingScreeen,
          child: Text("View Reservation"),
        ),
      ],
      scrollable: true,
      title: const Text("Booking Confirmation"),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: [
            Text(
                "Your booking is reserved against Bookind Id : ${widget.bookidId}"),
            Text(
                "Please send 25% of toal fare ${widget.fare / 4} SAR as an advance payment on following bank account for booking reservation"),
            const Text("Bank Name : Natwest bank"),
            const Text("Account Title : Safa& marwa tours"),
            const Text("Ac : 81674570"),
            const Text("Ac : 517032"),
            const Text(
                "Please share tranfer id or screenshot on our whatsapp or for any query contact us"),
          ],
        ),
      ),
    );
  }
}
