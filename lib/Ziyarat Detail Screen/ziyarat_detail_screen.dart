import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../General Widget/appbar_widget.dart';
import '../General Widget/payment_dialogue.dart';
import '../Package Detail Screen/Widgets/car_card_widget.dart';
import '../Ziyarat Screen/Provider/ziyarat_provider.dart';
import './Widgets/Ziyarat_detail_Widget.dart';
import '../General Widget/bottom_navigation_widget.dart';

class ZiyaratDetailScreen extends StatefulWidget {
  @override
  State<ZiyaratDetailScreen> createState() => _ZiyaratDetailScreenState();
}

class _ZiyaratDetailScreenState extends State<ZiyaratDetailScreen> {
  String? imageUrl;

  int? id;

  int? carId;

  String? name;

  double? price;

  int? noOfSeats;

  int? noOfLuggage;

  List<String>? points;

  String? carName;

  Future<void> makeBooking() async {
    var bookingId = await Provider.of<ZiyaratProvider>(context, listen: false)
        .createZiyaratBooking(carId!, id!, price!);
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
            "Unable to make Ziyarat booking, Try again later",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => PaymentDialogue(price!, bookingId),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    carId = arguments["carId"];
    id = arguments["id"];
    imageUrl = arguments["imageUrl"];
    price = arguments["price"];
    points = arguments["points"];
    name = arguments["name"];
    carName = arguments["carName"];
    noOfSeats = arguments["noOfSeats"];
    noOfLuggage = arguments["noOfLuggage"];
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(130),
            child: AppbarWidget(name!, false),
          ),
          bottomNavigationBar: BottomNavigationWidget(),
          body: Column(
            children: [
              //ImageCardWidget(),
              CarCardWidget(carName!, noOfSeats!, noOfLuggage!, imageUrl!),
              Expanded(
                child: ListView(
                  children: [
                    ZiyaratDetailWidget(points!, price!),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: ElevatedButton(
            onPressed: makeBooking,
            child: const Text(
              "Book Now",
            ),
          )),
    );
  }
}
