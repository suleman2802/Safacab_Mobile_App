import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import '../../Authentication Screen/Provider/user_provider.dart';
import '../../config.dart';
import '../Model/car_package.dart';
import '../Model/package.dart';

class PackageProvider extends ChangeNotifier {
  Future<List<Package>> fetchPackageRecord() async {
    //
    //   try {
    //     const String apiUrl = 'https://server.safacab.com/packages';
    //
    //     final response = await https.get(Uri.parse(apiUrl));
    //     if (response.statusCode == 200) {
    //       final data = json.decode(response.body);
    //       final List packagesData = data['data'];
    //       List<Package> _packages = [];
    //       _packages = packagesData.map((json) => Package.fromJson(json)).toList();
    //       return _packages;
    //     } else {
    //       print('Failed to load Package record, Status code: ${response.statusCode}');
    //       print(response.body);
    //       return [];
    //     }
    //   } catch (error) {
    //     print(error);
    //     return [];
    //   }
    final response =
        await https.get(Uri.parse('https://server.safacab.com/packages'));

    if (response.statusCode == 200) {
      print("Api hit successfullly");
      List<Package> packages = [];
      final jsonData = json.decode(response.body);

      for (var packageData in jsonData['data']) {
        for (var car in packageData['cars']) {
          if (car['booked'] == 0 && !isAlreadyAdded(packages, car['id'])) {
            packages.add(Package(
              packageData['id'],
              packageData['name'],
              "https://$baseUrl/${car['image']}",
              car['id'],
              car['type'],
              car['number_plate'],
              car['driver_name'],
              car['luggage_capacity'],
              car['seating_capacity'],
              car['car_package']['price'].toDouble(),
              (packageData['details'] as String)
                  .replaceAll("\"", "")
                  .split(', ')
                  .map((e) => e.trim())
                  .toList(),
            ));
          }
        }
      }

      return packages;
    } else {
      print("Api hit failed");
      print('Failed to load packages ${response.statusCode}');
      print(response.body);
      return [];
    }
  }

  isAlreadyAdded(List<Package> packages, int carId) {
    for (var package in packages) {
      if (package.carId == carId) {
        return true;
      }
    }
    return false;
  }

  Future<CarPackage> fetchCarPackage(int carId) async {
    final response = await https.get(Uri.parse(
        'https://server.safacab.com/packages/car-packages?carId=$carId'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']
          [0]; // Assuming the response contains a list
      return CarPackage(
        data['id'],
        "https://$baseUrl/${data['image']}",
        data['type'],
        data['number_plate'],
        data['luggage_capacity'],
        data['seating_capacity'],
        (data['packages'] as List)
            .map((pkg) => Package(
                  pkg['id'],
                  pkg['name'],
                  "https://$baseUrl/${data['image']}",
                  data['id'],
                  data['type'],
                  data['number_plate'],
                  data['driver_name'],
                  data['luggage_capacity'],
                  data['seating_capacity'],
                  (pkg['car_package']['price'] as num).toDouble(),
                  (pkg['details'] as String).replaceAll('"', '').split(', '),
                ))
            .toList(),
      );
    } else {
      print('Failed to load car package ${response.statusCode}');
      print(response.body);
      return CarPackage(-1, "", "", "", -1, -1, []);
    }
  }

  Future<String> createPackageBooking(
      int carId, int bookingTypeId, double fare) async {
    var url = Uri.parse("https://server.safacab.com/bookings/create");
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    var body = json.encode({
      "car_id": carId,
      "booking_type": "package",
      "booking_type_id": bookingTypeId,
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
