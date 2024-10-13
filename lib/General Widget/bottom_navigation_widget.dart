import 'package:flutter/material.dart';
import '../Routes/route_controller.dart';
class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(80),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => navigateToHomeScreen(context),
            icon: Icon(
              size: 40,
              Icons.home,
            ),
          ),
          IconButton(
            onPressed: () => navigateToBookingScreen(context),
            icon: Icon(
              size: 40,
              Icons.calendar_month,
            ),
          ),

          IconButton(
            onPressed: () => navigateToProfileScreen(context),
            icon: Icon(
              size: 40,
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
