import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../General Widget/payment_dialogue.dart';
import '../Packages Screen/Model/car_package.dart';
import '../Packages Screen/Provider/package_provider.dart';
import './Widgets/car_card_widget.dart';
import './Widgets/package_card_widget.dart';
import '../General Widget/appbar_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({super.key});

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  int? selectedCarId;

  Future<CarPackage> getPackageByCarId() async {
    return await Provider.of<PackageProvider>(context)
        .fetchCarPackage(selectedCarId!);
  }

  Future<void> makeBooking(int carId, int id, double price) async {
    var bookingId = await Provider.of<PackageProvider>(context, listen: false)
        .createPackageBooking(carId, id, price);
    if (bookingId! == "f") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: const Text(
            "You have already one reserved booking",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      return;
    }
    if (bookingId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: const Text(
            "Unable to make package booking, Try again later",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => PaymentDialogue(price, bookingId),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    selectedCarId = arguments["carId"];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Toyota", false),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: FutureBuilder(
          future: getPackageByCarId(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Column(
                children: [
                  CarCardWidget(
                      snapshot.data!.carName,
                      snapshot.data!.noOfSeats,
                      snapshot.data!.noOfLuaggage,
                      snapshot.data!.carImageUrl),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.packages.length,
                      itemBuilder: (context, index) => PackageCardWidget(
                        index + 1,
                        snapshot.data!.packages[index].points,
                        snapshot.data!.packages[index].price,
                        snapshot.data!.packages[index].id,
                        snapshot.data!.packages[index].carId,
                        makeBooking,
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
