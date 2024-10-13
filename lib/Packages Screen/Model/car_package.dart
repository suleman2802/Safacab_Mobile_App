import './package.dart';

class CarPackage {
  final int carId;
  final String carImageUrl;
  final String carName;
  final String carNumber;
  final int noOfLuaggage;
  final int noOfSeats;
  List<Package> packages;

  CarPackage(this.carId, this.carImageUrl, this.carName, this.carNumber,
      this.noOfLuaggage, this.noOfSeats, this.packages);
}
