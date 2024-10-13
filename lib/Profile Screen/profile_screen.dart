import 'package:flutter/material.dart';
import './Widgets/profile_option_widget.dart';
import '../General Widget/appbar_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';
import './Widgets/profile_header_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: AppbarWidget("Profile", true),
        ),
        bottomNavigationBar: BottomNavigationWidget(),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeaderWidget(),
                const SizedBox(
                  height: 35,
                ),
                ProfileOptionWidget(),
              ],
            ),
          ),
        ));
  }
}
