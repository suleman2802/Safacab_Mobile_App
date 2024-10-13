import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  String _title;
  bool _isCanvas;

  AppbarWidget(this._title,this._isCanvas);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 130,
      backgroundColor: _isCanvas? Theme.of(context).canvasColor:Theme.of(context).scaffoldBackgroundColor,
      title: Text(_title),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(80),
          ),
        ),
      ),
    );
  }
}
