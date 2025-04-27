import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';
import '../models/car.dart';
import '../models/booking.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'car_rental.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    // Create users table
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        lastName TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        phone TEXT
      )
    ''');

    // Create cars table
    await db.execute('''
      CREATE TABLE cars (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        brand TEXT NOT NULL,
        year TEXT NOT NULL,
        price TEXT NOT NULL,
        seats TEXT NOT NULL,
        transmission TEXT NOT NULL,
        body TEXT NOT NULL,
        fuel TEXT NOT NULL,
        imageName TEXT NOT NULL
      )
    ''');

    // Create bookings table
    await db.execute('''
      CREATE TABLE bookings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        carId INTEGER NOT NULL,
        startDate TEXT NOT NULL,
        endDate TEXT NOT NULL,
        totalPrice TEXT NOT NULL,
        FOREIGN KEY (userId) REFERENCES users (id),
        FOREIGN KEY (carId) REFERENCES cars (id)
      )
    ''');

    // Insert initial cars
    final cars = [
      {
        'brand': 'DODGE CHALLENGER',
        'year': '2021',
        'price': '45000',
        'seats': '4',
        'transmission': 'Автомат',
        'body': 'Купе',
        'fuel': 'Бензин',
        'imageName': 'dodge.jpg'
      },
      {
        'brand': 'HYUNDAI ACCENT',
        'year': '2024',
        'price': '15000',
        'seats': '5',
        'transmission': 'Автомат',
        'body': 'Седан',
        'fuel': 'Бензин',
        'imageName': 'accent.jpg'
      },
      {
        'brand': 'CADILLAC ESCALADE',
        'year': '2025',
        'price': '75000',
        'seats': '7',
        'transmission': 'Автомат',
        'body': 'Внедорожник',
        'fuel': 'Бензин',
        'imageName': 'escalade.jpg'
      },
      {
        'brand': 'TOYOTA CAMRY',
        'year': '2019',
        'price': '25000',
        'seats': '5',
        'transmission': 'Автомат',
        'body': 'Седан',
        'fuel': 'Бензин',
        'imageName': 'camry.jpg'
      }
    ];

    for (final carData in cars) {
      await db.insert('cars', carData);
    }
  }

  // User operations
  Future<User> createUser(User user) async {
    final db = await database;
    final id = await db.insert('users', user.toMap());
    return user.copyWith(id: id);
  }

  Future<User?> getUser(String email, String password) async {
    final db = await database;
    final maps = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  // Car operations
  Future<List<Car>> getCars() async {
    final db = await database;
    final maps = await db.query('cars');
    return maps.map((map) => Car.fromMap(map)).toList();
  }

  Future<Car?> getCarById(int id) async {
    final db = await database;
    final maps = await db.query(
      'cars',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Car.fromMap(maps.first);
    }
    return null;
  }

  // Booking operations
  Future<Booking> createBooking(Booking booking) async {
    final db = await database;
    final id = await db.insert('bookings', booking.toMap());
    return booking.copyWith(id: id);
  }

  Future<List<Booking>> getUserBookings(int userId) async {
    final db = await database;
    final maps = await db.query(
      'bookings',
      where: 'userId = ?',
      whereArgs: [userId],
      orderBy: 'startDate DESC',
    );
    return maps.map((map) => Booking.fromMap(map)).toList();
  }

  Future<bool> isCarAvailable(int carId, DateTime startDate, DateTime endDate) async {
    final db = await database;
    final maps = await db.query(
      'bookings',
      where: 'carId = ?',
      whereArgs: [carId],
    );

    for (var map in maps) {
      final booking = Booking.fromMap(map);
      if (startDate.isBefore(booking.endDate) && endDate.isAfter(booking.startDate)) {
        return false;
      }
    }
    return true;
  }

  Future<void> cancelBooking(int bookingId) async {
    final db = await database;
    await db.delete(
      'bookings',
      where: 'id = ?',
      whereArgs: [bookingId],
    );
  }
}
