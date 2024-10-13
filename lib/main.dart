import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Privacy Policy Screen/privacy_policy_screen.dart';
import './TermsAndConditionScreen/termsAndConditionScreen.dart';
import './Ziyarat Screen/ziyarat_screen.dart';
import './Avaliable Car Screen/avaliable_car_screen.dart';
import './Package Detail Screen/package_detail_screen.dart';
import './Ziyarat Detail Screen/ziyarat_detail_screen.dart';
import './Booking Screen/booking_screen.dart';
import './Reviews Screen/reviews_screen.dart';
import './Routes/route_name.dart';
import './Authentication Screen/authentication_screen.dart';
import './Home Screen/home_screen.dart';
import './Forget Password Screen/forget_screen.dart';
import './Profile Screen/profile_screen.dart';

// import './Navigationbar Screen/navigationbar_screen.dart';
import './Change Username Screen/change_username_screen.dart';
import './Change Password Screen/change_password_screen.dart';
import './Packages Screen/packages_screen.dart';
import './provider_list.dart';
import './Change PhoneNumber Screen/change_phoneNumber_screen.dart';
import './Ride Screen/ride_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Safa Cab',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 245, 190),
          //Color.fromARGB(255, 246, 240, 185)
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 24,
            ),
            displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              // color: Theme.of(context).canvasColor,
              fontSize: 28,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.yellow,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.black,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 22,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
            ),
          ),
          primaryColor: Colors.yellow,
          canvasColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        ),
        routes: {
          homeScreen: (context) => HomeScreen(),
          authenticationScreen: (context) => AuthenticationScreen(),
          forgetPasswordScreen: (context) => ForgetPasswordScreen(),
          profileScreen: (context) => ProfileScreen(),
          //navigationbarScreen: (context) => NavigationbarScreen(),
          changeUsernameScreen: (context) => ChangeUsernameScreen(),
          changePasswordScreen: (context) => ChangePasswordScreen(),
          bookingScreen: (context) => BookingScreen(),
          reviewScreen: (context) => ReviewsScreen(),
          packagesScreen: (context) => PackagesScreen(),
          packageDetailScreen: (context) => PackageDetailScreen(),
          ziyaratDetailScreen: (context) => ZiyaratDetailScreen(),
          avaliableCarScreen: (context) => AvaliableCarScreen(),
          // trainScreen: (context) => TrainScreen(),
          // aeroplaneScreen:(context) => AeroplaneScreen(),
          ziyaratScreen: (context) => ZiyaratScreen(),
          termsAndConditionScreen: (context) => TermsAndConditionScreen(),
          privacyPolicyScreen: (context) => PrivacyPolicyScreen(),
          rideScreen: (context) => RideScreen(),
          changePhoneNumberScreen: (context) => ChangePhoneNumberScreen()
        },
        home: AuthenticationScreen(),
      ),
    );
  }
}
