import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:safa_cab/Authentication%20Screen/Provider/user_provider.dart';
import '../../config.dart';
import '../Model/review.dart';

class ReviewProvider extends ChangeNotifier {
  Future<List<Review>> getReviews() async {
    final headers = {
      //'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    print("access token : ${UserProvider.userInstance.accessToken}");
    final response = await https.get(
      Uri.parse('https://server.safacab.com/reviews'),
      //headers: headers
    );

    if (response.statusCode == 200) {
      print("Api hit successfully for review");
      List<Review> reviewList = [];
      List<dynamic> faresJson = jsonDecode(response.body)['data'];

      for (var fareData in faresJson) {
        print(fareData);
        if (fareData['user'] != null) {
          print("added ${fareData["id"]}");
          Review fare = Review(
            fareData["id"],
            fareData["user"]["username"],
            fareData['review'],
          );
          reviewList.add(fare);
        }
      }

      return reviewList;
    } else {
      print("Api hit failed status code : ${response.statusCode}");
      print(response.body);
      return [];
    }
  }
}

// Future<String> getUserNameById(int id) async {
//   final response = await https
//       .get(Uri.parse('https://server.safacab.com/users/user?userId=$id'));
//
//   if (response.statusCode == 200) {
//     print("Api hit successfullly");
//     final jsonData = json.decode(response.body);
//     return jsonData["data"]["username"];
//   } else {
//     print("Api failed to get username status code : ${response.statusCode}");
//     print(response.body);
//     return "User";
//   }
// }
