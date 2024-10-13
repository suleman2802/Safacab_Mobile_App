import 'package:flutter/material.dart';

class SingleOptionWidget extends StatelessWidget {
  String _title;
  var function;

  SingleOptionWidget(this._title, this.function);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: InkWell(
        onTap: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
