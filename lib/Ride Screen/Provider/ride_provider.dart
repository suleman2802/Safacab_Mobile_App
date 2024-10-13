import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import '../../Authentication Screen/Provider/user_provider.dart';
import '../../config.dart';

class RideProvider extends ChangeNotifier {
  Future<List<String>> fetchPickUpPoints(int carId) async {
    final url = Uri.parse(
        'https://server.safacab.com/rides/pickup-points?carId=$carId');
    final response = await https.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<String> pickupPoints = List<String>.from(jsonResponse['data']);
      return pickupPoints;
    } else {
      //throw Exception('Failed to load pickup points');
      print("failed to get an pick up points ${response.statusCode}");
      print(response.body);
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchDropOfPoints(
      String pickUp, int carId) async {
    final url = Uri.parse(
        'https://server.safacab.com/rides/drop-points?carId=$carId&pickupPoint=$pickUp');
    final response = await https.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<Map<String, dynamic>> pickupPoints =
          List<Map<String, dynamic>>.from(jsonResponse['data']);
      return pickupPoints;
    } else {
      //throw Exception('Failed to load pickup points');
      print("failed to get an drops of points ${response.statusCode}");
      print(response.body);
      return [];
    }
  }

  Future<double> isValidCoupon(String coupon) async {
    final headers = {
      //'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    final url = Uri.parse(
        'https://server.safacab.com/coupons/check-coupon?coupon=$coupon');
    final response = await https.get(url, headers: headers);

    if (response.statusCode == 200) {
      print("coupon api hit successfully");
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['data']['discount'];
    } else {
      print("coupon check failed status code : ${response.statusCode}");
      print(response.body);
      return -1;
    }
  }

  Future<String> createRideBooking(
      int carId,
      String pickUp,
      String dropOf,
      double fare,
      String date,
      String time,
      String couponCode,
      bool isvalidCoupon) async {
    print("date : $date");
    print("time : $time");
    var url = Uri.parse("https://server.safacab.com/bookings/create");
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    var body;
    isvalidCoupon
        ? body = json.encode({
            "car_id": carId,
            "booking_type_id": 1,
            "booking_type": "ride",
            "pickup_point": pickUp,
            "drop_point": dropOf,
            "fare": fare,
            "date": date,
            "time": time,
            "coupon": couponCode
          })
        : body = json.encode({
            "car_id": carId,
            "booking_type": "ride",
            "booking_type_id": 1,
            "pickup_point": pickUp,
            "drop_point": dropOf,
            "fare": fare,
            "date": date,
            "time": time,
          });
    var response = await https.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      print("booking create successfully");
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['booking_id'];
    }
    if (response.statusCode == 403) {
      print("booking is already there status code: ${response.statusCode}");
      print(response.body);
      return "f";
    }
    print("booking failed status code: ${response.statusCode}");
    print(response.body);
    return "";
  }
}
