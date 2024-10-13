import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import '../../config.dart';
import '../Model/car.dart';

class AvaliableCarProvider extends ChangeNotifier {
  Future<List<Car>> fetchCarData() async {
    final url = Uri.parse("https://${baseUrl + getCarUrl}");
    final response = await https.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data
          .where((car) => car['booked'] == 0)
          .map((car) => Car(
                car['id'],
                car['image'],
                car['type'],
                car['driver_name'],
                car['number_plate'],
                car['seating_capacity'],
                car['luggage_capacity'],
              ))
          .toList();
    } else {
      print("failed to called car get ${response.statusCode}");
      print(response.body);
      return [];
    }
  }
}
