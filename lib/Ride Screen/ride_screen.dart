import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/General%20Widget/payment_dialogue.dart';
import '../Ride Screen/Provider/ride_provider.dart';
import '../General Widget/selected_car_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';

class RideScreen extends StatefulWidget {
  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  String? bookingId;
  List<String>? pickUpPoints;
  List<String> dropOfPoints = [];
  List<Map<String, dynamic>>? dropOfFare;
  double? fare;
  String? selectedPickUp;
  String? selectedDropOf;
  DateTime? _selectedDate;
  String? _selectedTime;
  int? selectedCarId;
  String? selectedCarName;
  int? selectedCarSeats;
  int? selectedCarLuggage;
  String? selectedCarImageUrl;
  final TextEditingController couponController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool isValidCoupon = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    couponController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    priceController.text = "Select location";
    _selectedDate = DateTime.now();
    _selectedTime = DateFormat('HH:mm:a').format(DateTime.now());
  }

  Future<void> _StartDatePicker() async {
    // showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime.now(),
    //   lastDate: DateTime.now().add(
    //     Duration(days: 7),
    //   ),
    // ).then((pickedDate) {
    //   if (pickedDate == null) {
    //     return;
    //   } else {
    //     setState(() {
    //       _selectedDate = pickedDate;
    //     });
    //   }
    // });
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }

  void _TimePicker() {
    // showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime.now(),
    //   lastDate: DateTime.now().add(
    //     Duration(days: 7),
    //   ),
    // )
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      if (pickedTime == null) {
        return;
      } else {
        setState(() {
          _selectedTime = pickedTime.format(context).toString(); //pickedTime;
        });
      }
    });
  }

  Future<void> getPickUpPoints() async {
    pickUpPoints = await Provider.of<RideProvider>(context, listen: false)
        .fetchPickUpPoints(selectedCarId!);
  }

  Future<void> getDropOfPoints() async {
    dropOfFare = await Provider.of<RideProvider>(context, listen: false)
        .fetchDropOfPoints(selectedPickUp!, selectedCarId!);
    print(dropOfFare);

    setState(() {
      dropOfPoints =
          dropOfFare!.map((map) => map['drop_point'] as String).toList();
    });
  }

  calculateFare() {
    double? estimatedfare;
    for (var map in dropOfFare!) {
      if (map['drop_point'] == selectedDropOf) {
        estimatedfare = map['fare'].toDouble();
      }
    }
    priceController.text = "${estimatedfare.toString()} SAR";

    fare = estimatedfare;
  }

  showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  bool isCredentials() {
    if (_selectedTime == null) {
      showSnackBar("Please select Booking time");
      return false;
    }
    if (_selectedDate == null) {
      showSnackBar("Please select Booking date");
      return false;
    }
    if (selectedPickUp == null) {
      showSnackBar("Please select pick up point");
      return false;
    }
    if (selectedDropOf == null) {
      showSnackBar("Please select drop of point");
      return false;
    }
    return true;
  }

  createBooking() async {
    if (isCredentials()) {
      bookingId = await Provider.of<RideProvider>(context, listen: false)
          .createRideBooking(
              selectedCarId!,
              selectedPickUp!,
              selectedDropOf!,
              fare!,
              DateFormat('yyyy-MM-dd').format(_selectedDate!),
              _selectedTime!,
              couponController.text.trim(),
              isValidCoupon);
      if (bookingId! == "f") {
        showSnackBar("You have already one reserved booking");
        return;
      }
      if (bookingId!.isEmpty) {
        showSnackBar("Unable to make booking, Try again later");
      } else {
        showDialog(
          context: context,
          builder: (context) => PaymentDialogue(fare!, bookingId!),
        );
      }
    }
  }

  checkCouponStatus() async {
    double result = await Provider.of<RideProvider>(context, listen: false)
        .isValidCoupon(couponController.text.trim());
    if (result >= 0.0) {
      isValidCoupon = true;
      fare = fare! - result;
      priceController.text = "${fare.toString()} SAR";

      showSnackBar("You have receive discount of $result");
    } else {
      showSnackBar("Invalid Coupon code");
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    selectedCarId = arguments["carId"];
    selectedCarName = arguments["carName"];
    selectedCarSeats = arguments["noOfSeats"];
    selectedCarLuggage = arguments["noOfLuggage"];
    selectedCarImageUrl = arguments["imageUrl"];

    return Scaffold(
      //backgroundColor:Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Ride Booking",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(80),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    FutureBuilder(
                        future:
                            selectedPickUp == null ? getPickUpPoints() : null,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select Pick up point",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 16),
                                ),
                                Container(
                                  color: Theme.of(context).canvasColor,
                                  height: 50,
                                  child: FittedBox(
                                    child: DropdownMenu(
                                      onSelected: (value) async {
                                        setState(() {
                                          selectedPickUp = value;
                                        });
                                        await getDropOfPoints();
                                      },
                                      width: 200,
                                      dropdownMenuEntries: pickUpPoints!
                                          .map<DropdownMenuEntry<String>>(
                                            (data) => DropdownMenuEntry(
                                              label: data,
                                              value: data,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Destination point",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 16),
                        ),
                        Container(
                          color: Theme.of(context).canvasColor,
                          height: 50,
                          child: FittedBox(
                            child: DropdownMenu(
                              onSelected: (value) {
                                setState(() {
                                  selectedDropOf = value;
                                });
                                calculateFare();
                              },
                              width: 200,
                              dropdownMenuEntries: dropOfPoints
                                  .map<DropdownMenuEntry<String>>(
                                    (data) => DropdownMenuEntry(
                                      label: data,
                                      value: data,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Estimated Fare : ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 8),
                              child: TextFormField(
                                enabled: false,
                                controller: priceController,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Selected Car",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelectedCarWidget(selectedCarImageUrl!, selectedCarName!,
                        selectedCarSeats!, selectedCarLuggage!),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      color: Theme.of(context).canvasColor,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                _selectedDate == null
                                    ? 'Pick up Date'
                                    : getFormattedDate(_selectedDate!),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.calendar_month,
                                    size: 30,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: _StartDatePicker)
                            ],
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                _selectedTime == null
                                    ? 'Pick up Time'
                                    : _selectedTime!,
                                //!.format(context).toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.lock_clock,
                                    size: 30,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: _TimePicker),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 60,
                      color: Theme.of(context).canvasColor,
                      padding: const EdgeInsets.all(8),
                      child: Stack(children: [
                        TextFormField(
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                          controller: couponController,
                          decoration: const InputDecoration(
                              label: Text("Apply Coupon Code"),
                              labelStyle: TextStyle(
                                fontSize: 18,
                              )),
                        ),
                        Positioned(
                            right: 1,
                            child: TextButton(
                              onPressed: checkCouponStatus,
                              child: Text(
                                "Check Coupon",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            )),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 90),
              ),
              onPressed: createBooking,
              child: const Text("Book Now"),
            ),
          ],
        ),
      ),
    );
  }
}
