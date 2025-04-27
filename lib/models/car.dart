class Car {
  final int? id;
  final String brand;
  final String year;
  final String price;
  final String seats;
  final String transmission;
  final String body;
  final String fuel;
  final String imageName;

  Car({
    this.id,
    required this.brand,
    required this.year,
    required this.price,
    required this.seats,
    required this.transmission,
    required this.body,
    required this.fuel,
    required this.imageName,
  });

  // Преобразование объекта в Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'year': year,
      'price': price,
      'seats': seats,
      'transmission': transmission,
      'body': body,
      'fuel': fuel,
      'imageName': imageName
    };
  }

  // Преобразование Map в объект Car
  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'] as int?,
      brand: map['brand']?.toString() ?? '',
      year: map['year']?.toString() ?? '',
      price: map['price']?.toString() ?? '',
      seats: map['seats']?.toString() ?? '',
      transmission: map['transmission']?.toString() ?? '',
      body: map['body']?.toString() ?? '',
      fuel: map['fuel']?.toString() ?? '',
      imageName: map['imageName']?.toString() ?? 'default_car.png',
    );
  }

  Car copyWith({
    int? id,
    String? brand,
    String? year,
    String? price,
    String? seats,
    String? transmission,
    String? body,
    String? fuel,
    String? imageName
  }) {
    return Car(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      year: year ?? this.year,
      price: price ?? this.price,
      seats: seats ?? this.seats,
      transmission: transmission ?? this.transmission,
      body: body ?? this.body,
      fuel: fuel ?? this.fuel,
      imageName: imageName ?? this.imageName,
    );
  }
}
