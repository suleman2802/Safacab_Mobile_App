import 'package:flutter/material.dart';

class PackageTileWidget extends StatelessWidget {
  final String _carName;
  final int _personCount;
  final int _luggageCount;
  final String imageUrl;

  PackageTileWidget(
      this._carName, this._personCount, this._luggageCount, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2, // Give this column more space in the row
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Align text to the left
              children: [
                Text(
                  _carName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Premium Packages"),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.group_rounded),
                    const SizedBox(width: 5),
                    Text("$_personCount Persons"),
                    const SizedBox(width: 10),
                    const Icon(Icons.shopping_bag),
                    const SizedBox(width: 5),
                    Text("$_luggageCount Luggage"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.9,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
