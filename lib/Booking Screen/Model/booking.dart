class Booking {
  int id;
  String bookingId;
  String bookingType;
  String status;
  String date;
  String time;
  String carName;
  String carImageUrl;
  bool isReviewed;
  String carId;

  Booking(
      this.id,
      this.bookingId,
      this.status,
      this.date,
      this.time,
      this.carName,
      this.carImageUrl,
      this.isReviewed,
      this.bookingType,
      this.carId);
}
