class Car {
  final String id;
  final String name;
  final String brand;
  final String model;
  final String imageAsset;
  final double price;
  final String description;
  final List<String> features;
  final String transmission;
  final int seats;
  final String fuelType;
  final double rating;

  const Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.imageAsset,
    required this.price,
    required this.description,
    required this.features,
    required this.transmission,
    required this.seats,
    required this.fuelType,
    required this.rating,
  });
}