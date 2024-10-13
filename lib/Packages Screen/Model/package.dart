class Package{
  final int id;
  final String packageName;
  final String carImageUrl;
  final int carId;
  final String carName;
  final String carNumber;
  final String driverName;

  //final String driverNumber;
  final int noOfLuaggage;
  final int noOfSeats;
  final double price;
  List<String> points;

  Package(
      this.id,
      this.packageName,
      this.carImageUrl,
      this.carId,
      this.carName,
      this.carNumber,
      this.driverName,
      this.noOfLuaggage,
      this.noOfSeats,
      this.price,
      this.points);
}