import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Authentication Screen/Provider/user_provider.dart';
import './profile_pic_widget.dart';

class ProfileHeaderWidget extends StatefulWidget {
  @override
  State<ProfileHeaderWidget> createState() => _ProfileHeaderWidgetState();
}

class _ProfileHeaderWidgetState extends State<ProfileHeaderWidget> {
  String username = "username";
  String email = "email";

  fetchUserNameAndEmail() {
    email = Provider.of<UserProvider>(context, listen: false).getUserEmail();
    username = Provider.of<UserProvider>(context, listen: false).getUserName();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserNameAndEmail();
  }

  @override
  Widget build(BuildContext context) {
    return //Row(
        //children: [
        // ProfilePicWidget(),
        //SizedBox(width: 25,),
        Column(
      children: [
        Text(
          username,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          email,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        //  ],
        //  ),
      ],
    );
  }
}
