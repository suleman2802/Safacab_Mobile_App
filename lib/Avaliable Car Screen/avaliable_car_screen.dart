import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/Avaliable%20Car%20Screen/Provider/avaliable_car_provider.dart';
import '../General Widget/selected_car_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';
import '../General Widget/appbar_widget.dart';
import '../Routes/route_controller.dart';
import './Model/car.dart';

class AvaliableCarScreen extends StatefulWidget {
  @override
  State<AvaliableCarScreen> createState() => _AvaliableCarScreenState();
}

class _AvaliableCarScreenState extends State<AvaliableCarScreen> {
  Future<List<Car>> fetchCarList() async {
    return await Provider.of<AvaliableCarProvider>(context).fetchCarData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Available Cars", false),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 5),
        child: FutureBuilder(
            future: fetchCarList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => InkWell(
                      child: Column(
                        children: [
                          SelectedCarWidget(
                              snapshot.data![index].carImageUrl,
                              snapshot.data![index].carName,
                              snapshot.data![index].noOfSeats,
                              snapshot.data![index].noOfLuggage),
                          const SizedBox(
                            height: 3,
                          ),
                          //Divider(color: Theme.of(context).scaffoldBackgroundColor,),
                        ],
                      ),
                      onTap: () => navigateToRideScreen(
                            context,
                            snapshot.data![index].carId,
                            snapshot.data![index].noOfSeats,
                            snapshot.data![index].noOfLuggage,
                            snapshot.data![index].carImageUrl,
                            snapshot.data![index].carName,
                          )),
                );
              }
            }),
      ),
    );
  }
}
