class Car {
  final int carId;
  final String carImageUrl;
  final String carName;
  final String carNumber;
  final String driverName;
  final int noOfSeats;
  final int noOfLuggage;

  Car(
      this.carId,
      this.carImageUrl,
      this.carName,
      this.driverName,
      this.carNumber,
      this.noOfSeats,
      this.noOfLuggage);

  factory Car.fromJson(Map<String, dynamic> json) {
    try {
      return Car(
        json['id'],
        "https://server.safacab.com/${json['image']}",
        json['type'],
        json['driver_name'],
        json['number_plate'],
        json['seating_capacity'],
        json['luggage_capacity'],
      );
    } catch (error) {
      print(error);
      return Car(-1, "", "", "", "", -1, -1);
    }
  }
}
