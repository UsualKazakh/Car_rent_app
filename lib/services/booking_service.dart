import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new booking
  Future<void> createBooking(Booking booking) async {
    try {
      await _firestore.collection('bookings').add({
        'userId': booking.userId,
        'carId': booking.carId,
        'startDate': booking.startDate.toIso8601String(),
        'endDate': booking.endDate.toIso8601String(),
        'totalPrice': booking.totalPrice,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Get bookings for a user
  Stream<List<Booking>> getUserBookings(int userId) {
    return _firestore
        .collection('bookings')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Booking(
          id: int.parse(doc.id),
          userId: data['userId'],
          carId: data['carId'],
          startDate: DateTime.parse(data['startDate']),
          endDate: DateTime.parse(data['endDate']),
          totalPrice: data['totalPrice'],
        );
      }).toList();
    });
  }

  // Check if car is available for the selected dates
  Future<bool> isCarAvailable(int carId, DateTime startDate, DateTime endDate) async {
    try {
      final bookings = await _firestore
          .collection('bookings')
          .where('carId', isEqualTo: carId)
          .get();

      for (var booking in bookings.docs) {
        final data = booking.data();
        final bookedStart = DateTime.parse(data['startDate']);
        final bookedEnd = DateTime.parse(data['endDate']);

        // Check if there's any overlap with existing bookings
        if (startDate.isBefore(bookedEnd) && endDate.isAfter(bookedStart)) {
          return false;
        }
      }

      return true;
    } catch (e) {
      rethrow;
    }
  }

  // Cancel a booking
  Future<void> cancelBooking(String bookingId) async {
    try {
      await _firestore.collection('bookings').doc(bookingId).delete();
    } catch (e) {
      rethrow;
    }
  }
}
