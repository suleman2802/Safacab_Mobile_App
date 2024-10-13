import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/General%20Widget/appbar_widget.dart';

import '../Authentication Screen/Provider/user_provider.dart';

class ChangeUsernameScreen extends StatefulWidget {
  static const String routeName = "/changeUsernameScreen";

  @override
  State<ChangeUsernameScreen> createState() => _ChangeUsernameScreenState();
}

class _ChangeUsernameScreenState extends State<ChangeUsernameScreen> {
  final _usernameController = TextEditingController();

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

  Future<void> changeUsername() async {
    String result = await Provider.of<UserProvider>(context, listen: false)
        .changeUserName(_usernameController.text.trim());
    showSnackBar(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Change Username", false),
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
                  key: const ValueKey("username"),
                  controller: _usernameController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return "Enter a new Username of at least 5 character";
                    } else {
                      null;
                    }
                  },
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      labelText: "New Username",
                      hintText: "ahmad"),
                ),
              ),
              SizedBox(
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
                      changeUsername();
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
