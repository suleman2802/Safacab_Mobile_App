import 'package:flutter/material.dart';
class HelpAndSupportDialogue extends StatelessWidget {
  const HelpAndSupportDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 270,
        child: AlertDialog(
          backgroundColor: Theme.of(context).canvasColor,
          title: const Text("Help & Support",),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Feel Free to contact us,if ou have any query"),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.email_outlined, color: Theme.of(context).primaryColor,),
                    const SizedBox(width: 5,),
                    const Text(
                      "info@safacab.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.phone_forwarded_outlined , color: Theme.of(context).primaryColor,),
                    const SizedBox(width: 5,),
                    const Text(
                      "+966-56-976-4551",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
