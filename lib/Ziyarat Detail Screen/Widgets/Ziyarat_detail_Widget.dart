import 'package:flutter/material.dart';

class ZiyaratDetailWidget extends StatelessWidget {
  List<String> _packageItems;
  double _price;

  ZiyaratDetailWidget(this._packageItems, this._price);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ziya-rats List",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "${_price.toString()} SR",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          Column(
            children: _packageItems
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        //SizedBox(width: 25,),
                        Icon(Icons.trending_flat_outlined),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          e,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
