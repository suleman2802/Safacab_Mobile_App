import 'package:flutter/material.dart';
import 'package:safa_cab/config.dart';

class SelectedCarWidget extends StatelessWidget {
  final String _carName;
  final int _personCount;
  final int _luggageCount;
  final String _imageUrl;

  SelectedCarWidget(
      this._imageUrl, this._carName, this._personCount, this._luggageCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _carName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.group_rounded),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("$_personCount Persons"),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.shopping_bag),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("$_luggageCount Luggage"),
                  ],
                ),
              ],
            ),
          ),
          Image.network(
            fit: BoxFit.fitWidth,
            "https://$baseUrl/$_imageUrl",
            width: MediaQuery.of(context).size.width / 2.4,
          ),
        ],
      ),
    );
  }
}
