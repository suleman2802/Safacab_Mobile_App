import 'package:flutter/material.dart';

class NumberHeadingTextWidget extends StatelessWidget {
  final String _text;

  NumberHeadingTextWidget(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        _text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
