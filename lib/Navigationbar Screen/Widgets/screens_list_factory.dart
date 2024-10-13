import 'package:flutter/material.dart';
import 'package:safa_cab/Ziyarat%20Screen/ziyarat_screen.dart';
import '../../Aeroplane%20Screen/aeroplane_screen.dart';
import '../../Packages%20Screen/packages_screen.dart';
import '../../Reviews%20Screen/reviews_screen.dart';
import '../../Train%20Screen/train_screen.dart';
import '../../Home Screen/home_screen.dart';
import '../../Profile Screen/profile_screen.dart';
import '../../Booking Screen/booking_screen.dart';

final List<Widget> _screens = [
  //tab bar screens
  HomeScreen(),
  BookingScreen(),
  ProfileScreen(),
  //nested screens
  TrainScreen(),
  AeroplaneScreen(),
  PackagesScreen(),
  ZiyaratScreen(),
  ReviewsScreen(),
];

Widget ScreenFactory(int index) {
  return _screens[index];
}

int ScreenIndex(String screenName) {
  int result = _screens.indexWhere(
    (element) => element.toString() == screenName,
  );
  return result < 0 ? 0 : result;
}
