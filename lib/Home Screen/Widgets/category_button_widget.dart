import 'package:flutter/material.dart';

class CategoryButtonWidget extends StatelessWidget {
  String _title;
  String _subtitle;
  String _assetName;
  var _function;

  CategoryButtonWidget(
      this._title, this._subtitle, this._assetName, this._function);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _function,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).canvasColor,
              child: Image.asset(
                'assets/Category/$_assetName.png',
                fit: BoxFit.scaleDown,
                width: 40,
                height: 40,
              ),
            ),
          ),
          Text(
            _title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            _subtitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
