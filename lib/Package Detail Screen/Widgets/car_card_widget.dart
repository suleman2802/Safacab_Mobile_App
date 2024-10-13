import 'package:flutter/material.dart';

import '../../config.dart';

class CarCardWidget extends StatelessWidget {
  String _name;
  int _numberOfPerson;
  int _numberOfLuggage;
  String imageUrl;

  CarCardWidget(
      this._name, this._numberOfPerson, this._numberOfLuggage, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child:
                //Image.asset("assets/Category/car.png"),
                Image.network(
              fit: BoxFit.fitWidth,
              imageUrl,
              // width: MediaQuery.of(context).size.width / 2.4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.person),
                  Text("${_numberOfPerson.toString()} Person"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.luggage),
                  Text("${_numberOfLuggage.toString()} Luggage"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.ac_unit),
                  Text("Ac"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
