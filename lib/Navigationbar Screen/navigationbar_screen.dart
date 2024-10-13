// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../Booking Screen/booking_screen.dart';
// import '../Home Screen/home_screen.dart';
// import '../Profile Screen/profile_screen.dart';
//
// class NavigationbarScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return CupertinoTabView(
//               builder: (context) {
//                 return HomeScreen();
//               },
//             );
//           case 1:
//             return CupertinoTabView(
//               builder: (context) {
//                 return BookingScreen();
//               },
//             );
//           case 2:
//             return CupertinoTabView(
//               builder: (context) {
//                 return ProfileScreen();
//               },
//             );
//           default:
//             return SizedBox();
//         }
//       },
//       tabBar: CupertinoTabBar(
//         activeColor: Theme.of(context).primaryColor,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.home),
//             // label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.calendar_badge_plus),
//             // label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.profile_circled),
//             // label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:safa_cab/Aeroplane%20Screen/aeroplane_screen.dart';
// import 'package:safa_cab/Booking%20Screen/booking_screen.dart';
// import 'package:safa_cab/Home%20Screen/home_screen.dart';
// import 'package:safa_cab/Packages%20Screen/packages_screen.dart';
// import 'package:safa_cab/Profile%20Screen/profile_screen.dart';
// import 'package:safa_cab/Reviews%20Screen/reviews_screen.dart';
// import 'package:safa_cab/Train%20Screen/train_screen.dart';
// import 'package:safa_cab/Ziyarat%20Screen/ziyarat_screen.dart';
// import './Widgets/screens_list_factory.dart';
//
// class NavigationbarScreen extends StatefulWidget {
//   @override
//   State<NavigationbarScreen> createState() => _NavigationScreenState();
// }
//
// class _NavigationScreenState extends State<NavigationbarScreen> {
//   int _currentIndex = 0;
//   final List<Widget> _screens = [
//     //tab bar screens
//     HomeScreen(),
//     BookingScreen(),
//     ProfileScreen(),
//     //nested screens
//     // TrainScreen(),
//     // AeroplaneScreen(),
//     // PackagesScreen(),
//     // ZiyaratScreen(),
//     // ReviewsScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     // final receiveData = ModalRoute.of(context)!.settings.arguments as Map;
//     // _currentIndex = receiveData["index"];
//     return Scaffold(
//       body: _screens[_currentIndex],//ScreenFactory(_currentIndex),//_screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Theme.of(context).primaryColor,
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.date_range_sharp),
//             label: 'Booking',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
