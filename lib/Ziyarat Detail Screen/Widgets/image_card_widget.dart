import 'package:flutter/material.dart';
class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/Category/car.png"),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}
