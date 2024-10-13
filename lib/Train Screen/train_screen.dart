import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../General Widget/selected_car_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';

class TrainScreen extends StatefulWidget {
  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  List<String> pointList = [
    "Train 1",
    "Train 2",
    "Train 3",
  ];

  DateTime? _selectedDate;
  String? _selectedTime;

  void _StartDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 7),
      ),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Train Station Pick/Drop",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationWidget(),
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
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Pick up location",
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
                              width: 200,
                              dropdownMenuEntries: pointList
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
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Destination location",
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
                              width: 200,
                              dropdownMenuEntries: pointList
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Selected Car",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SelectedCarWidget("", "Toyota Camry", 4, 2),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      color: Theme.of(context).canvasColor,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                _selectedDate == null
                                    ? 'Pick up Date'
                                    : DateFormat("yyyy-MM-dd")
                                        .format(_selectedDate!),
                                style: TextStyle(
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
                                _selectedDate == null
                                    ? 'Pick up Time'
                                    : _selectedTime!,
                                //!.format(context).toString(),
                                style: TextStyle(
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
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 60,
                      color: Theme.of(context).canvasColor,
                      padding: EdgeInsets.all(8),
                      child: Form(
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: Text("Apply Coupon Code"),
                              labelStyle: TextStyle(
                                fontSize: 18,
                              )),
                          validator: (value) => null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 90),
              ),
              onPressed: () {},
              child: Text("Book Now"),
            ),
          ],
        ),
      ),
    );
  }
}
