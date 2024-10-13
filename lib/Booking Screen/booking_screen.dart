import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../General Widget/appbar_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';
import './Widgets/list_tile_widget.dart';

import './Provider/booking_provider.dart';
import 'Model/booking.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Future<List<Booking>> getBookingRecord() async {
    return await Provider.of<BookingProvider>(context).getBookingRecord();
    return [];
  }

  // Future<void> testing()async{
  //   await Provider.of<BookingProvider>(context).getBookingRecord();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppbarWidget("Bookings", false),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: FutureBuilder(
          future: getBookingRecord(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 5),
                child: snapshot.data!.length > 0
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            ListTileWidget(
                                snapshot.data![index].id,
                                snapshot.data![index].bookingId,
                                snapshot.data![index].status,
                                snapshot.data![index].date,
                                snapshot.data![index].time,
                                snapshot.data![index].carName,
                                snapshot.data![index].carImageUrl,
                                snapshot.data![index].isReviewed,
                                snapshot.data![index].carId,
                                snapshot.data![index].bookingType),
                            const SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text(
                          "No Booking against this account, Make Booking first",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
              );
            }
          }),
    );
  }
}
