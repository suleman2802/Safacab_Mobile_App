import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/General%20Widget/appbar_widget.dart';

import '../Authentication Screen/Provider/user_provider.dart';

class ChangePhoneNumberScreen extends StatefulWidget {
  static const String routeName = "/ChangePhoneNumberScreen";

  @override
  State<ChangePhoneNumberScreen> createState() =>
      _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
  final _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        duration: const Duration(
          seconds: 3,
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> changePhoneNumber() async {
    String result = await Provider.of<UserProvider>(context, listen: false)
        .changePhoneNumber(_phoneNumberController.text.trim());
    showSnackBar(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Change Phone Number", false),
      ),
      body: Container(
        height: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(40),
        ),
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                  key: const ValueKey("PhoneNumber"),
                  controller: _phoneNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Phone Number";
                    } else if (value.length != 13) {
                      return "Please enter a valid phone number";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      labelText: "New PhoneNumber",
                      hintText: "+923174881221"),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    FocusScope.of(context).unfocus();

                    if (isValid) {
                      _formKey.currentState!.save();
                      changePhoneNumber();
                    } else {
                      null;
                    }
                  },
                  child: const Text(
                    "Update",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
