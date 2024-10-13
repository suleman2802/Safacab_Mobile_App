// import 'package:flutter/cupertino.dart';
// import 'package:safa_cab/Avaliable%20Car%20Screen/avaliable_car_screen.dart';
// // import '../Navigationbar Screen/Widgets/screens_list_factory.dart';
//
// import '../Authentication Screen/authentication_screen.dart';
// import '../Booking Screen/booking_screen.dart';
// import '../Change Password Screen/change_password_screen.dart';
// import '../Change Username Screen/change_phoneNumber_screen.dart';
// import '../Forget Password Screen/forget_screen.dart';
// import '../Home Screen/home_screen.dart';
// import '../Navigationbar Screen/navigationbar_screen.dart';
// import '../Packages Screen/packages_screen.dart';
// import '../Profile Screen/profile_screen.dart';
// import '../Reviews Screen/reviews_screen.dart';
// import "../Aeroplane Screen/aeroplane_screen.dart";
// import "../Train Screen/train_screen.dart";
// import "../Ziyarat Screen/ziyarat_screen.dart";
// import '../Package Detail Screen/package_detail_screen.dart';
// import '../Ziyarat Detail Screen/ziyarat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:safa_cab/Ziyarat%20Detail%20Screen/ziyarat_detail_screen.dart';
import './route_name.dart';

navigateToForgetPasswordScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => ForgetPasswordScreen(),
//   ),
// );
    Navigator.pushNamed(context, forgetPasswordScreen);

// navigateToNavigationbarScreen(BuildContext context) =>
//     Navigator.of(context).push(
//       CupertinoPageRoute(
//         builder: (context) => NavigationbarScreen(),
//       ),
//     );
//     Navigator.pushNamed(context, navigationbarScreen, arguments: {
//       "index": ScreenIndex("HomeScreen"),
//     });

navigateToHomeScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => HomeScreen(),
//   ),
// );

// Navigator.pushNamed(context, navigationbarScreen, arguments: {
//   "index": ScreenIndex("HomeScreen"),
// });

    Navigator.pushNamed(context, homeScreen);

navigateToProfileScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => ProfileScreen(),
//   ),
// );
// Navigator.pushNamed(context, navigationbarScreen, arguments: {
//   "index": ScreenIndex("ProfileScreen"),
// });
    Navigator.pushNamed(context, profileScreen);

navigateToChangePasswordScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => ChangePasswordScreen(),
//   ),
// );
    Navigator.pushNamed(context, changePasswordScreen);

navigateToChangeUsernameScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => ChangeUsernameScreen(),
//   ),
// );
    Navigator.pushNamed(context, changeUsernameScreen);

navigateToChangePhoneNumberScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => ChangeUsernameScreen(),
//   ),
// );
    Navigator.pushNamed(context, changePhoneNumberScreen);

navigateToBookingScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => BookingScreen(),
//   ),
// );
// Navigator.pushNamed(context, navigationbarScreen, arguments: {
//   "index": ScreenIndex("BookingScreen"),
// });
    Navigator.pushNamed(context, bookingScreen);

navigateToReviewScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => ReviewsScreen(),
//   ),
// );
// Navigator.pushNamed(context, navigationbarScreen, arguments: {
//   "index": ScreenIndex("ReviewScreenScreen"),
// });
    Navigator.pushNamed(context, reviewScreen);

navigateToZiyaratScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => ZiyaratScreen(),
//   ),
// );
// Navigator.pushNamed(context, navigationbarScreen, arguments: {
//   "index": ScreenIndex("ZiyaratScreen"),
// });
    Navigator.pushNamed(context, ziyaratScreen);

navigateToPackagesScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => PackagesScreen(),
//   ),
// );
// Navigator.pushNamed(context, navigationbarScreen, arguments: {
//   "index": ScreenIndex("PackagesScreen"),
// });
    Navigator.pushNamed(context, packagesScreen);

// navigateToTrainScreen(BuildContext context) =>
// Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => TrainScreen(),
//   ),
// );
// Navigator.pushNamed(context, navigationbarScreen, arguments: {
//   "index": ScreenIndex("TrainScreen"),
// });
//     Navigator.pushNamed(context, trainScreen);

// navigateToAeroplaneScreen(BuildContext context) =>
// Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => AeroplaneScreen(),
//   ),
// );
// Navigator.pushNamed(context, navigationbarScreen, arguments: {
//   "index": ScreenIndex("AeroplaneScreen"),
// });
//     Navigator.pushNamed(context, aeroplaneScreen);

navigateToRideScreen(BuildContext context, carId, noOfSeats, noOfLuggage,
        imageUrl, carName) =>
    Navigator.pushNamed(context, rideScreen, arguments: {
      "carId": carId,
      "carName": carName,
      "noOfSeats": noOfSeats,
      "noOfLuggage": noOfLuggage,
      "imageUrl": imageUrl,
    });

navigateToAuthenticationScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => AuthenticationScreen(),
//   ),
// );
    Navigator.pushNamed(context, authenticationScreen);

navigateToPackageDetailScreen(BuildContext context, int carId) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => PackageDetailScreen(),
//   ),
// );
    Navigator.pushNamed(context, packageDetailScreen,
        arguments: {"carId": carId});

navigateToZiyaratDetailScreen(
        BuildContext context,
        int carId,
        int id,
        String name,
        String ziyaratImageUrl,
        price,
        List<String> points,
        String carName,
        int seats,
        int luagge) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => ZiyaratDetailScreen(),
//   ),
// );
    Navigator.pushNamed(
      context,
      ziyaratDetailScreen,
      arguments: {
        "carId": carId,
        "id": id,
        "imageUrl": ziyaratImageUrl,
        "price": price,
        "points": points,
        "name": name,
        "carName": carName,
        "noOfSeats": seats,
        "noOfLuggage": luagge,
      },
    );

navigateToAvaliableScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => AvaliableCarScreen(),
//   ),
// );
    Navigator.pushNamed(
      context,
      avaliableCarScreen,
      // arguments: {"_isAirport": _isAirport},
    );

navigateToPrivacyPolicyScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => PrivacyPolicyScreen(),
//   ),
// );
    Navigator.pushNamed(context, privacyPolicyScreen);

navigateToTermsAndConditionScreen(BuildContext context) =>
    // Navigator.of(context).push(
//   CupertinoPageRoute(
//     builder: (context) => TermsAndConditionScreen(),
//   ),
// );
    Navigator.pushNamed(context, termsAndConditionScreen);
