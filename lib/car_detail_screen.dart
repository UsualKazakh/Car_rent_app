import 'package:flutter/material.dart';
import 'main.dart'; // Импортируй main.dart, где определен класс Car
import 'booking_screen.dart'; // Импортируй экран бронирования

class CarDetailScreen extends StatelessWidget {
  final Car car;

  CarDetailScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(car.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(car.image, width: double.infinity, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text("Модель: ${car.name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Цена: ${car.price}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text(
              "Описание: Это премиальный автомобиль с современными технологиями и комфортом. Идеально подходит для длительных поездок и деловых встреч.",
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(
                      carName: car.name,
                      carPrice: car.price,
                    ),
                  ),
                );
              },
              child: Text("Забронировать"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), // Замени primary на backgroundColor
            ),
          ],
        ),
      ),
    );
  }
}