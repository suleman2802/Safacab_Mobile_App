import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import 'package:safa_cab/Ziyarat Screen/Model/ziyarat.dart';
import '../../Authentication Screen/Provider/user_provider.dart';
import '../../Avaliable Car Screen/Model/car.dart';
import '../../config.dart';

class ZiyaratProvider extends ChangeNotifier {
  Future<List<Ziyarat>> getZiyaratList() async {
    try {
      const String apiUrl = 'https://server.safacab.com/admin/ziyarats';

      final response = await https.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<Ziyarat> ziyarats = [];
        List<dynamic> data = jsonDecode(response.body)['data'];

        for (var item in data) {
          int carId = item['car_id'];
          Car car = await getCarById(carId);
          if (car.carId >= 0) {
            Ziyarat ziyarat = Ziyarat.fromJson(item, car);
            ziyarats.add(ziyarat);
          }
        }

        return ziyarats;
      } else {
        print(
            'Failed to load Ziyarat record, Status code: ${response.statusCode}');
        print(response.body);
        return [];
      }
    } catch (error) {
      print(error);
      return [];
    }
  }

  Future<Car> getCarById(int id) async {
    try {
      String apiUrl = 'https://server.safacab.com/cars/car?carId=$id';
      final response = await https.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body)['data'];
        if (jsonResponse["booked"] == 0) {
          return Car.fromJson(jsonResponse);
        } else {
          print('car is booked');
          return Car(-1, "", "", "", "", -1, -1);
        }
      } else {
        print(
            'Failed to load car with ID $id, Status code: ${response.statusCode}');
        return Car(-1, "", "", "", "", -1, -1);
      }
    } catch (error) {
      return Car(-1, "", "", "", "", -1, -1);
    }
  }

  Future<String> createZiyaratBooking(
      int carId, int bookingTypeId, double fare) async {
    var url = Uri.parse("https://server.safacab.com/bookings/create");
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    var body = json.encode({
      "car_id": carId,
      "booking_type": "ziyarat",
      "booking_type_id": bookingTypeId,
    });
    var response = await https.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      print("booking create successfully");
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['booking_id'];
    }
    if (response.statusCode == 403) {
      return "f";
    }
    print("booking failed status code: ${response.statusCode}");
    print(response.body);
    return "";
  }
}
