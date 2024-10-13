import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import '../General Widget/appbar_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  resetPassword() async {
    final headers = {
      'Content-Type': 'application/json',
      // "Authorization": "Bearer ${UserProvider.userInstance.accessToken}"
    };
    // print("access token : ${UserProvider.userInstance.accessToken}");
    final response = await https.post(
      Uri.parse('https://server.safacab.com/auth/reset-password'),
      headers: headers,
      body: jsonEncode({"email": emailController.text.trim()}),
    );

    if (response.statusCode == 200) {
      print("Password change api hit successfully");
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: const Text(
            "Password Reset Application Received checked registered email",
            style: TextStyle(
              color: Colors.black,
            ),
          )));
    } else {
      print("Failed to hit passwdrd change api ${response.statusCode}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: const Text(
            "No email found against this email, Enter valid email",
            style: TextStyle(
              color: Colors.black,
            ),
          )));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Forget Password", false),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(40),
          ),
          margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 185,
              child: Column(
                children: [
                  const Text(
                    "Enter your Registered Email Address",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: emailController,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                          //labelText: "Enter Registered Email Address",
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          // ),
                          ),
                      key: const ValueKey("email"),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return "Enter a valid Email Address";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: resetPassword, // _validateUserEmail,
                      child: const Text(
                        "Reset Password?",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
