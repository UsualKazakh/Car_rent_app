class Booking {
  final int? id;
  final int userId;
  final int carId;
  final DateTime startDate;
  final DateTime endDate;
  final double totalPrice;

  Booking({
    this.id,
    required this.userId,
    required this.carId,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'carId': carId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'totalPrice': totalPrice,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as int?,
      userId: map['userId'] as int,
      carId: map['carId'] as int,
      startDate: DateTime.parse(map['startDate'] as String),
      endDate: DateTime.parse(map['endDate'] as String),
      totalPrice: (map['totalPrice'] as num).toDouble(),
    );
  }

  Booking copyWith({
    int? id,
    int? userId,
    int? carId,
    DateTime? startDate,
    DateTime? endDate,
    double? totalPrice,
  }) {
    return Booking(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      carId: carId ?? this.carId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
