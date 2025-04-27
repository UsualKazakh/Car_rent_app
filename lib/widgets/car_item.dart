import 'package:flutter/material.dart';
import '../models/car.dart';
import '../pages/car_details_page.dart';

class CarItem extends StatelessWidget {
  final Car car;
  
  const CarItem({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/${car.brand.split(' ')[0].toLowerCase()}.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.brand,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${car.price} тг/день',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Год: ${car.year}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarDetailsPage(car: car),
                    ),
                  );
                },
                child: const Text('Подробнее'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
