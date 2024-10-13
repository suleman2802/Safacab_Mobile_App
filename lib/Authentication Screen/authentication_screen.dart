import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/Authentication%20Screen/Provider/user_provider.dart';
import './Widgets/header_widget.dart';
import '../General Widget/appbar_widget.dart';
import '../Routes/route_controller.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _passwordVisible = false;
  bool _cpasswordVisible = false;
  bool _isAgency = false;
  bool _isLogin = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    _phoneNumberController.dispose();
  }

  void trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      if (_isLogin) {
        if (await isValidUser()) {
          navigateToHomeScreen(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              content: const Text(
                "Invalid Credentials",
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        }
      } else {
        if (await createAccount()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              content: const Text(
                "Account Created Successfully Please Login again",
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
          navigateToAuthenticationScreen(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              content: const Text(
                "Unable to create account try again later",
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        }
      }
    }
  }

  Future<bool> isValidUser() async {
    if (_emailController.text.trim() == "admin@safacab.com" &&
        _passwordController.text.trim() == "SafaCab@123") {
      return false;
    }
    bool result = await Provider.of<UserProvider>(context, listen: false)
        .Login(_emailController.text.trim(), _passwordController.text.trim());
    return result;
  }

  Future<bool> createAccount() async {
    bool result = await Provider.of<UserProvider>(context, listen: false)
        .SignUp(
            _emailController.text.trim(),
            _usernameController.text.trim(),
            _passwordController.text.trim(),
            _phoneNumberController.text.trim(),
            _isAgency);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppbarWidget(
          _isLogin ? "Login" : "Sign up",
          true,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset("assets/logo.png"),
              SizedBox(
                height: 7,
              ),
              HeaderWidget(
                  _isLogin ? "Login into the account" : "Create a new account"),
              space(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      key: const ValueKey("email"),
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter registered email address";
                        } else if (!value.contains("@") ||
                            !value.contains(".")) {
                          return "Please enter email address of right format";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        suffixIcon: Icon(
                          Icons.email_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        hintText: "Email",
                      ),
                    ),
                    space(),
                    !_isLogin
                        ? Column(
                            children: [
                              TextFormField(
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                                key: const ValueKey("username"),
                                controller: _usernameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter username";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        10,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  suffixIcon: Icon(
                                    Icons.person,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  hintText: "username",
                                ),
                              ),
                              space(),
                              TextFormField(
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                                key: const ValueKey("phoneNumber"),
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
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        10,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  suffixIcon: Icon(
                                    Icons.phone,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  hintText: "Phone Number",
                                ),
                              ),
                              space(),
                            ],
                          )
                        : empty(),
                    TextFormField(
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      key: const ValueKey("password"),
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        hintText: "Password",
                      ),
                    ),
                    space(),
                    !_isLogin
                        ? Column(
                            children: [
                              TextFormField(
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                                key: const ValueKey("Confirm password"),
                                controller: _confirmPasswordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please re-enter password";
                                  } else if (value !=
                                      _passwordController.text) {
                                    return "Please enter same password";
                                  }
                                  return null;
                                },
                                obscureText: _cpasswordVisible,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        10,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _cpasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _cpasswordVisible = !_cpasswordVisible;
                                      });
                                    },
                                  ),
                                  hintText: "Confirm Password",
                                ),
                              ),
                              space(),
                            ],
                          )
                        : empty(),
                  ],
                ),
              ),
              !_isLogin
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Signup as Agency"),
                            Checkbox(
                              value: _isAgency,
                              onChanged: (value) => setState(() {
                                _isAgency = !_isAgency;
                              }),
                              activeColor: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ],
                    )
                  : empty(),
              _isLogin
                  ? TextButton(
                      onPressed: () => navigateToForgetPasswordScreen(context),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget Password",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  fixedSize: Size(130, 65),
                ),
                onPressed: trySubmit,
                child: Text(
                  _isLogin ? "Login" : "Signup",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _isLogin
                        ? "Don't have an account"
                        : "Already have an account",
                  ),
                  TextButton(
                    onPressed: () => setState(() {
                      _isLogin = !_isLogin;
                    }),
                    child: Text(
                      _isLogin ? "Sign up" : "Login",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget empty() {
    return const SizedBox();
  }

  Widget space() {
    return const SizedBox(
      height: 25,
    );
  }
}
