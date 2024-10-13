import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  String _title;

  HeaderWidget(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
