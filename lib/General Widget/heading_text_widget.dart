import 'package:flutter/material.dart';

class HeadingTextWidget extends StatelessWidget {
  final String _text;

  HeadingTextWidget(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(
        _text,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Theme.of(context).primaryColor,
          fontSize: 28,
            ),
      ),
    );
  }
}
