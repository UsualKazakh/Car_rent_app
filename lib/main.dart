import 'package:flutter/material.dart';
import 'models/car.dart';
import 'screens/car_detail_screen.dart';

void main() {
  runApp(const CarRentalApp());
}

class CarRentalApp extends StatelessWidget {
  const CarRentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CarListScreen(),
    );
  }
}

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  // Статические данные для машин
  static final List<Car> cars = [
    Car(
      id: '1',
      name: 'BMW X5',
      brand: 'BMW',
      model: 'X5',
      imageAsset: 'assets/bmw.png',
      price: 100.0,
      description: 'Luxury SUV with premium features',
      features: ['Leather seats', 'Panoramic roof', 'Navigation'],
      transmission: 'Automatic',
      seats: 5,
      fuelType: 'Petrol',
      rating: 4.5,
    ),
    Car(
      id: '2',
      name: 'Audi Q7',
      brand: 'Audi',
      model: 'Q7',
      imageAsset: 'assets/audi.png',
      price: 120.0,
      description: 'Premium SUV with advanced technology',
      features: ['7 seats', 'LED lights', 'Quattro'],
      transmission: 'Automatic',
      seats: 7,
      fuelType: 'Diesel',
      rating: 4.8,
    ),
    Car(
      id: '3',
      name: 'Tesla Model 3',
      brand: 'Tesla',
      model: 'Model 3',
      imageAsset: 'assets/tesla.png',
      price: 90.0,
      description: 'Electric sedan with autopilot',
      features: ['Autopilot', 'Electric', 'Glass roof'],
      transmission: 'Automatic',
      seats: 5,
      fuelType: 'Electric',
      rating: 4.7,
    ),
    Car(
      id: '4',
      name: 'Kia Sportage',
      brand: 'Kia',
      model: 'Sportage',
      imageAsset: 'assets/kia.png',
      price: 70.0,
      description: 'Compact SUV with great value',
      features: ['Apple CarPlay', 'Android Auto', 'Parking sensors'],
      transmission: 'Automatic',
      seats: 5,
      fuelType: 'Petrol',
      rating: 4.2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Заголовок с прокручиваемым баннером
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Car Rental'),
              background: Image.asset(
                'assets/bmw.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Раздел Featured Cars (горизонтальный ListView)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Cars',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cars.length,
                      itemBuilder: (context, index) {
                        final car = cars[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CarDetailScreen(car: car),
                              ),
                            );
                          },
                          child: Container(
                            width: 160,
                            margin: const EdgeInsets.only(right: 16),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    car.imageAsset,
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          car.name,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text('\$${car.price}/day'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Раздел All Cars (ListView.builder)
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final car = cars[index];
                return ListTile(
                  leading: Image.asset(
                    car.imageAsset,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(car.name),
                  subtitle: Text('\$${car.price}/day'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailScreen(car: car),
                      ),
                    );
                  },
                );
              },
              childCount: cars.length,
            ),
          ),
          // Раздел GridView (сетка машин)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'All Cars (Grid View)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 400,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: cars.length,
                      itemBuilder: (context, index) {
                        final car = cars[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CarDetailScreen(car: car),
                              ),
                            );
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  car.imageAsset,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        car.name,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text('\$${car.price}/day'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}