import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models/car.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  // Получение экземпляра базы данных
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cars.db');
    return _database!;
  }

  // Инициализация базы данных
  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);  // Используем другое имя переменной
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Создание таблицы и инициализация данных
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cars(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        brand TEXT,
        year TEXT,
        price TEXT,
        seats TEXT,
        transmission TEXT,
        body TEXT,
        fuel TEXT
        imageName TEXT
      )
    ''');

    // Добавление тестовых данных
    final sampleCars = [
      Car(
        brand: 'BMW M5',
        year: '2023',
        price: '25000',
        seats: '5',
        transmission: 'Автомат',
        body: 'Седан',
        fuel: 'Бензин',
        imageName: 'bmw_m5.jpg',
      ),
      Car(
        brand: 'Audi RS7',
        year: '2023',
        price: '28000',
        seats: '5',
        transmission: 'Автомат',
        body: 'Лифтбек',
        fuel: 'Бензин',
        imageName: 'audi_rs7.jpg',
      ),
      Car(
        brand: 'Tesla Model S',
        year: '2020',
        price: '30000',
        seats: '5',
        transmission: 'Автомат',
        body: 'Лифтбек',
        fuel: 'Электро',
        imageName: 'tesla_model_s.jpg',
      ),
      Car(
        brand: 'KIA K8',
        year: '2017',
        price: '20000',
        seats: '5',
        transmission: 'Автомат',
        body: 'Седан',
        fuel: 'Бензин',
        imageName: 'kia_k8.jpg',
      ),

    ];

    for (var car in sampleCars) {
      await db.insert('cars', car.toMap());
    }
  }

  // Вставка нового автомобиля
  Future<void> insertCar(Car car) async {
    final db = await instance.database;
    await db.insert('cars', car.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Получение всех автомобилей
  Future<List<Car>> getCars() async {
    final db = await instance.database;
    final result = await db.query('cars');
    return result.map((e) => Car.fromMap(e)).toList();
  }

  // Удаление автомобиля по ID
  Future<void> deleteCar(int id) async {
    final db = await instance.database;
    await db.delete('cars', where: 'id = ?', whereArgs: [id]);
  }
}
