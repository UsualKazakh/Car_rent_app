import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car.dart';

class CarService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get all cars
  Stream<List<Car>> getCars() {
    return _firestore.collection('cars').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Car.fromJson(doc.data()..['id'] = doc.id);
      }).toList();
    });
  }

  // Get car by id
  Future<Car?> getCarById(String id) async {
    try {
      final doc = await _firestore.collection('cars').doc(id).get();
      if (doc.exists) {
        return Car.fromJson(doc.data()!..['id'] = doc.id);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Get available cars
  Stream<List<Car>> getAvailableCars() {
    return _firestore
        .collection('cars')
        .where('isAvailable', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Car.fromJson(doc.data()..['id'] = doc.id);
      }).toList();
    });
  }

  // Search cars
  Stream<List<Car>> searchCars(String query) {
    return _firestore
        .collection('cars')
        .where('brand', isGreaterThanOrEqualTo: query)
        .where('brand', isLessThan: query + 'z')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Car.fromJson(doc.data()..['id'] = doc.id);
      }).toList();
    });
  }

  // Add car (admin only)
  Future<void> addCar(Car car) async {
    try {
      await _firestore.collection('cars').add(car.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Update car (admin only)
  Future<void> updateCar(Car car) async {
    try {
      await _firestore.collection('cars').doc(car.id).update(car.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Delete car (admin only)
  Future<void> deleteCar(String id) async {
    try {
      await _firestore.collection('cars').doc(id).delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
