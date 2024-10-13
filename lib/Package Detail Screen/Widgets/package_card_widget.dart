import 'package:flutter/material.dart';

class PackageCardWidget extends StatelessWidget {
  var createBooking;
  int packageId;
  int _indexNo;
  List<String> _packageItems;
  double _price;
  int carId;

  PackageCardWidget(this._indexNo, this._packageItems, this._price,
      this.packageId, this.carId, this.createBooking);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            "Package ${_indexNo.toString()}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Column(
            children: _packageItems
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        //SizedBox(width: 25,),
                        const Icon(Icons.trending_flat_outlined),
                        const SizedBox(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Cost : ",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  Text(
                    "${_price.toString()} SR",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => createBooking(carId, packageId, _price),
                child: const Text("Book Now"),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
