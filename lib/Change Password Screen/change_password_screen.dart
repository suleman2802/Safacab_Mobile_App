import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/General%20Widget/appbar_widget.dart';

import '../Authentication Screen/Provider/user_provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = "/changePasswordScreen";

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPassword = TextEditingController();

  final newPassword = TextEditingController();

  final confirmPassword = TextEditingController();
  bool _newPasswordVisible = false;
  bool _cPasswordVisible = false;
  bool _oldPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  void getUserName() async {
    // _oldUsername =
    //     Provider.of<UserProvider>(context, listen: false).userDetails.getName();
  }

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

  Future<void> changePassword() async {
    String result = await Provider.of<UserProvider>(context, listen: false)
        .changePassword(oldPassword.text.trim(), newPassword.text.trim());
    showSnackBar(result);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    oldPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Change Password", false),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(40),
          ),
          height: MediaQuery.of(context).size.height * 0.45,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        key: const ValueKey("old password"),
                        controller: oldPassword,
                        obscureText: !_oldPasswordVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your old password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // focusedBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          // ),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          // ),
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: "Old Password",
                          hintText: "****",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _oldPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _oldPasswordVisible = !_oldPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        key: const ValueKey("new password"),
                        controller: newPassword,
                        obscureText: !_newPasswordVisible,
                        decoration: InputDecoration(
                          // focusedBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          // ),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          // ),
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: "New Password",
                          hintText: "****",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _newPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _newPasswordVisible = !_newPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      // AnimatedBuilder(
                      //   animation: newPassword,
                      //   builder: (context, child) {
                      //     final password = newPassword.text;
                      //
                      //     return PasswordStrengthChecker(
                      //       onStrengthChanged: (bool value) {
                      //         setState(() {
                      //           _isStrong = value;
                      //         });
                      //       },
                      //       password: password,
                      //     );
                      //   },
                      // ),
                      TextFormField(
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        key: const ValueKey("confirm password"),
                        validator: (value) {
                          if (newPassword.text.trim() != value!) {
                            return "Both password must be same";
                          } else {
                            null;
                          }
                        },
                        obscureText: !_cPasswordVisible,
                        decoration: InputDecoration(
                          // focusedBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          // ),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          // ),
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: "Confirm Password",
                          hintText: "****",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _cPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _cPasswordVisible = !_cPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // changePassword();
                        final isValid = _formKey.currentState!.validate();
                        FocusScope.of(context).unfocus();

                        if (isValid) {
                          _formKey.currentState!.save();
                          changePassword();
                        }
                      },
                      child: const Text(
                        "Update Password",
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
