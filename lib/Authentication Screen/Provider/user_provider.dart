import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';

import '../Model/user.dart';

class UserProvider extends ChangeNotifier {
  static User userInstance = User(-1, "", "", "");

  String getUserName() {
    return userInstance.username;
  }

  String getUserEmail() {
    return userInstance.email;
  }

  Future<bool> Login(String email, String password) async {
    var url = Uri.parse("https://server.safacab.com/auth/login");
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      "email": email,
      "password": password,
    });
    var response = await https.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      //print(decodedJson);
      userInstance = User(
        decodedJson["data"]["id"],
        decodedJson["data"]["username"],
        decodedJson["data"]["email"],
        decodedJson["data"]["accessToken"],
      );

      return true;
    } else {
      print("Login attemped failed status code : ${response.statusCode}");
      print(response.body);
      return false;
    }
  }

  Future<bool> SignUp(String email, String username, String password,
      String phoneNumber, bool isAgency) async {
    String apiUrl = "";
    if (isAgency) {
      apiUrl = "https://server.safacab.com/auth/signup?type=agency";
    } else {
      apiUrl = "https://server.safacab.com/auth/signup";
    }
    var url = Uri.parse(apiUrl);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      "email": email,
      "password": password,
      "username": username,
      "phone_no": phoneNumber
    });
    var response = await https.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      //print(decodedJson);
      userInstance = User(
          decodedJson["data"]["id"],
          decodedJson["data"]["username"],
          decodedJson["data"]["email"],
          //decodedJson["data"]["accessToken"],
          "");

      return true;
    } else {
      print("Sign up attemped failed status code : ${response.statusCode}");
      print(response.body);
      return false;
    }
  }

  Future<String> changePassword(String oldPassword, String newPassword) async {
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    print("access token : ${UserProvider.userInstance.accessToken}");
    final response = await https.put(
      Uri.parse('https://server.safacab.com/users/update-password'),
      headers: headers,
      body:
          jsonEncode({"oldPassword": oldPassword, "newPassword": newPassword}),
    );

    if (response.statusCode == 200) {
      print("Password change api hit successfullly");
      return "Password Changed successfully";
    } else {
      print("Failed to hit passwdrd change api ${response.statusCode}");
      var decodedJson = json.decode(response.body);
      return decodedJson["data"];
    }
  }

  Future<String> changePhoneNumber(String phoneNumber) async {
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    print("access token : ${UserProvider.userInstance.accessToken}");
    final response = await https.put(
      Uri.parse('https://server.safacab.com/users/update'),
      headers: headers,
      body: jsonEncode({"phone_no": phoneNumber}),
    );

    if (response.statusCode == 200) {
      print("Phone Number change api hit successfullly");
      return "Phone number Changed successfully";
    } else {
      print("Failed to hit password change api ${response.statusCode}");
      var decodedJson = json.decode(response.body);
      return decodedJson["data"];
    }
  }

  Future<String> changeUserName(String username) async {
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    print("access token : ${UserProvider.userInstance.accessToken}");
    final response = await https.put(
      Uri.parse('https://server.safacab.com/users/update'),
      headers: headers,
      body: jsonEncode({"username": username}),
    );

    if (response.statusCode == 200) {
      print("Password change api hit successfullly");
      userInstance.username = username;
      return "Username Changed successfully";
    } else {
      print("Failed to hit password change api ${response.statusCode}");
      var decodedJson = json.decode(response.body);
      return decodedJson["data"];
    }
  }
}
