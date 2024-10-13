import 'package:flutter/material.dart';

class ReviewDialogue extends StatefulWidget {
  var postReview;

  ReviewDialogue(this.postReview);

  @override
  State<ReviewDialogue> createState() => _ReviewDialogueState();
}

class _ReviewDialogueState extends State<ReviewDialogue> {
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Your Review"),
      actions: [
        ElevatedButton(
            onPressed: () {
              if (reviewController.text.length > 0) {
                widget.postReview(reviewController.text.trim());
              }
            },
            child: const Text("Post Review")),
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop,
            child: const Text("Cancel"))
      ],
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: reviewController,
        ),
      ),
    );
  }
}
