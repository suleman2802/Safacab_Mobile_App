import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/Booking%20Screen/Widgets/review_dialogue.dart';
import 'package:safa_cab/Routes/route_controller.dart';

import '../Provider/booking_provider.dart';

class ListTileWidget extends StatefulWidget {
  int id;
  String bookingId;
  String status;
  String date;
  String time;
  String carName;
  String carImageUrl;
  bool isReviewed;
  String carId;
  String bookingType;

  ListTileWidget(
      this.id,
      this.bookingId,
      this.status,
      this.date,
      this.time,
      this.carName,
      this.carImageUrl,
      this.isReviewed,
      this.carId,
      this.bookingType);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  postReview(String reviewText) async {
    bool result = await Provider.of<BookingProvider>(context, listen: false)
        .postReview(widget.id, widget.carId, reviewText, widget.bookingType);
    if (result) {
      showSnackBar("Review posted successfully");
      navigateToBookingScreen(context);
    } else {
      showSnackBar("unable to post review");
    }
  }

  cancelBooking() async {
    bool result = await Provider.of<BookingProvider>(context, listen: false)
        .cancelBooking(widget.id);
    if (result) {
      showSnackBar("Booking cancel successfully");
      navigateToBookingScreen(context);
    } else {
      showSnackBar("unable to cancel booking");
    }
  }

  showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      // child: ListTile(
      //   leading: Image.asset("assets/Category/car.png"),
      //   title: Text("Toyota Camery"),
      //   trailing: Column(
      //     children: [
      //       Text("28-5-2024"),
      //       Text(
      //         "5:30 AM",
      //         style: TextStyle(
      //             color: Theme.of(context).primaryColor,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ],
      //   ),
      // ),
      child: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Booking id : ${widget.bookingId}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Image.network(widget.carImageUrl),
                ),
                Column(
                  children: [
                    Text("Status : ${widget.status}"),
                    Text(
                      widget.carName,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(widget.date),
                    Text(
                      widget.time,
                    ),
                  ],
                ),
                Column(
                  children: [
                    widget.status == "pending approval"
                        ? ElevatedButton(
                            onPressed: cancelBooking,
                            child: const Text("Cancel"),
                          )
                        : const SizedBox(),
                    !widget.isReviewed && widget.status == "complete"
                        ? ElevatedButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) => ReviewDialogue(postReview),
                            ),
                            child: const Text("Post Review"),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
