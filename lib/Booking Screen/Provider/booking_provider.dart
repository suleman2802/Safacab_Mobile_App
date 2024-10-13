import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import '../../Authentication Screen/Provider/user_provider.dart';
import '../../config.dart';
import '../Model/booking.dart';

class BookingProvider extends ChangeNotifier {
  Future<List<Booking>> getBookingRecord() async {
    var url = Uri.parse("https://server.safacab.com/bookings/user-bookings");
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };

    final response = await https.get(url, headers: headers);

    if (response.statusCode == 200) {
      print("get booking record");
      List<Booking> bookings = [];
      //print(response.body);
      List<dynamic> data = jsonDecode(response.body);
      //print(data);

      for (var item in data) {
        DateTime dateTime = DateTime.parse(item["booking_date"]);
        String date = DateFormat('yyyy-MM-dd').format(dateTime);
        String time = DateFormat('hh:mm a').format(dateTime);
        bool isReviewd = await isReviewedCollected(
          item["booking_id"],
        );
        print(isReviewd);
        Booking booking = Booking(
            item["id"],
            item["booking_id"],
            item["status"],
            date,
            time,
            item["car"]["type"],
            "https://$baseUrl/${item["car"]["image"]}",
            isReviewd,
            item["booking_type"],
            item["car"]["id"].toString());
        bookings.add(booking);
      }

      return bookings;
    } else {
      print(
          "failed to get booking record status code : ${response.statusCode}");
      print(response.body);
      return [];
    }
  }

  Future<bool> postReview(int bookingId, String carId, String reviewText,
      String bookingType) async {
    String apiUrl = "https://server.safacab.com/reviews/create";

    var url = Uri.parse(apiUrl);
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    final body = json.encode({
      "booking_id": bookingId,
      "user_id": carId,
      "review": reviewText,
      "booking_type": bookingType
    });
    var response = await https.post(url, body: body, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print("review failed status code : ${response.statusCode}");
      print(response.body);
      return false;
    }
  }

  Future<bool> cancelBooking(int bookinId) async {
    String apiUrl =
        "https://server.safacab.com/bookings/cancel-booking?bookingId=$bookinId";
    var url = Uri.parse(apiUrl);
    final headers = {
      // 'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    final response = await https.put(url, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      print("cancel booking failed ${response.statusCode}");
      print(response.body);
      return false;
    }
  }

  Future<bool> isReviewedCollected(String bookingId) async {
    final url = Uri.parse('https://server.safacab.com/reviews');

    // Make the GET request to the API
    final response = await https.get(url);

    // Check if the response status is OK
    if (response.statusCode == 200) {
      print("review all api hitted");
      // Parse the JSON data
      final jsonResponse = json.decode(response.body);

      // Extract the data list
      final List<dynamic> dataList = jsonResponse['data'];

      // Check if any item in the list matches the bookingId
      for (var item in dataList) {
        if (item['booking_id'] == bookingId) {
          return true;
        }
      }
    }
    // Handle the case where the API call fails
    print('Failed to load data. Status code: ${response.statusCode}');
    return false;
  }
}
