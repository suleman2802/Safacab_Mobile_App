import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/Authentication%20Screen/Provider/user_provider.dart';
import 'package:safa_cab/Booking%20Screen/Provider/booking_provider.dart';
import './Packages Screen/Provider/package_provider.dart';
import './Ride Screen/Provider/ride_provider.dart';
import './Avaliable Car Screen/Provider/avaliable_car_provider.dart';
import './Ziyarat Screen/Provider/ziyarat_provider.dart';
import './Reviews Screen/Provider/review_provider.dart';

List<SingleChildWidget> providersList() {
  return [
    ChangeNotifierProvider(
      create: (_) => AvaliableCarProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => RideProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ZiyaratProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => PackageProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ReviewProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => BookingProvider(),
    ),
  ];
}
