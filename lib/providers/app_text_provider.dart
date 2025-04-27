import 'package:flutter/material.dart';

class AppTexts {
  // Home Page

  final String rentCar;
  final String availableCars;
  final String bookNow;
  final String aboutCompany;
  final String cars;
  final String clients;
  final String rating;
  final String popularCars;
  final String viewAll;
  final String noCarsAvailable;
  final String year;

  // Car Details Page
  final String specifications;
  final String price;
  final String seats;
  final String transmission;
  final String bodyType;
  final String fuelType;

  // Booking Page
  final String bookingDetails;
  final String startDate;
  final String endDate;
  final String days;
  final String total;
  final String confirmBooking;

  // Autopark Page
  final String carPark;
  final String searchCar;
  final String sortBy;
  final String ascending;
  final String descending;

  // Admin Page
  final String adminPanel;
  final String manageCars;
  final String manageBookings;
  final String manageProfiles;

  // Settings Page
  final String settings;
  final String darkTheme;
  final String language;

  AppTexts({
    // Home Page
    required this.rentCar,
    required this.availableCars,
    required this.bookNow,
    required this.aboutCompany,
    required this.cars,
    required this.clients,
    required this.rating,
    required this.popularCars,
    required this.viewAll,
    required this.noCarsAvailable,
    required this.year,

    // Car Details Page
    required this.specifications,
    required this.price,
    required this.seats,
    required this.transmission,
    required this.bodyType,
    required this.fuelType,

    // Booking Page
    required this.bookingDetails,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.total,
    required this.confirmBooking,

    // Autopark Page
    required this.carPark,
    required this.searchCar,
    required this.sortBy,
    required this.ascending,
    required this.descending,

    // Admin Page
    required this.adminPanel,
    required this.manageCars,
    required this.manageBookings,
    required this.manageProfiles,

    // Settings Page
    required this.settings,
    required this.darkTheme,
    required this.language,
  });

  static AppTexts get english => AppTexts(
    rentCar: 'Rent a Car',
    availableCars: 'Available Cars',
    bookNow: 'Book Now',
    aboutCompany: 'About Our Company',
    cars: 'Cars',
    clients: 'Clients',
    rating: 'Rating',
    popularCars: 'Popular Cars',
    viewAll: 'View All',
    noCarsAvailable: 'No cars available',
    year: 'Year',

    // Car Details Page
    specifications: 'Specifications',
    price: 'Price',
    seats: 'Seats',
    transmission: 'Transmission',
    bodyType: 'Body Type',
    fuelType: 'Fuel Type',

    // Booking Page
    bookingDetails: 'Booking Details',
    startDate: 'Start Date',
    endDate: 'End Date',
    days: 'Days',
    total: 'Total',
    confirmBooking: 'Booking confirmed!',

    // Autopark Page
    carPark: 'Car Park',
    searchCar: 'Search car',
    sortBy: 'Sort by',
    ascending: 'Ascending',
    descending: 'Descending',

    // Admin Page
    adminPanel: 'Admin Panel',
    manageCars: 'Manage Cars',
    manageBookings: 'Manage Bookings',
    manageProfiles: 'Manage Profiles',

    // Settings Page
    settings: 'Settings',
    darkTheme: 'Dark Theme',
    language: 'Language',
  );

  static AppTexts get russian => AppTexts(
    rentCar: 'Аренда Авто',
    availableCars: 'Доступные Автомобили',
    bookNow: 'Забронировать',
    aboutCompany: 'О Нашей Компании',
    cars: 'Автомобили',
    clients: 'Клиенты',
    rating: 'Рейтинг',
    popularCars: 'Популярные Автомобили',
    viewAll: 'Показать Все',
    noCarsAvailable: 'Нет доступных автомобилей',
    year: 'Год',

    // Car Details Page
    specifications: 'Характеристики',
    price: 'Цена',
    seats: 'Места',
    transmission: 'Коробка передач',
    bodyType: 'Тип кузова',
    fuelType: 'Тип топлива',

    // Booking Page
    bookingDetails: 'Детали бронирования',
    startDate: 'Дата начала',
    endDate: 'Дата окончания',
    days: 'Дней',
    total: 'Итого',
    confirmBooking: 'Бронирование подтверждено!',

    // Autopark Page
    carPark: 'Автопарк',
    searchCar: 'Поиск автомобиля',
    sortBy: 'Сортировать по',
    ascending: 'По возрастанию',
    descending: 'По убыванию',

    // Admin Page
    adminPanel: 'Панель администратора',
    manageCars: 'Управление автомобилями',
    manageBookings: 'Управление бронированиями',
    manageProfiles: 'Управление профилями',

    // Settings Page
    settings: 'Настройки',
    darkTheme: 'Темная тема',
    language: 'Язык',
  );

  static AppTexts get kazakh => AppTexts(
    rentCar: 'Көлік жалдау',
    availableCars: 'Қолжетімді көліктер',
    bookNow: 'Брондау',
    aboutCompany: 'Біздің компания туралы',
    cars: 'Көліктер',
    clients: 'Клиенттер',
    rating: 'Рейтинг',
    popularCars: 'Танымал көліктер',
    viewAll: 'Барлығын көрсету',
    noCarsAvailable: 'Қолжетімді көліктер жоқ',
    year: 'Жыл',

    // Car Details Page
    specifications: 'Сипаттамалары',
    price: 'Бағасы',
    seats: 'Орындар',
    transmission: 'Беріліс қорабы',
    bodyType: 'Шанақ түрі',
    fuelType: 'Отын түрі',

    // Booking Page
    bookingDetails: 'Брондау мәліметтері',
    startDate: 'Басталу күні',
    endDate: 'Аяқталу күні',
    days: 'Күндер',
    total: 'Барлығы',
    confirmBooking: 'Брондау расталды!',

    // Autopark Page
    carPark: 'Автопарк',
    searchCar: 'Көлік іздеу',
    sortBy: 'Сұрыптау',
    ascending: 'Өсу бойынша',
    descending: 'Кему бойынша',

    // Admin Page
    adminPanel: 'Әкімші панелі',
    manageCars: 'Көліктерді басқару',
    manageBookings: 'Брондауларды басқару',
    manageProfiles: 'Профильдерді басқару',

    // Settings Page
    settings: 'Параметрлер',
    darkTheme: 'Қараңғы тақырып',
    language: 'Тіл',
  );
}

class AppTextProvider extends ChangeNotifier {
  AppTexts _texts = AppTexts.english;
  
  AppTexts get texts => _texts;

  void setLanguage(String languageCode) {
    switch (languageCode) {
      case 'en':
        _texts = AppTexts.english;
        break;
      case 'ru':
        _texts = AppTexts.russian;
        break;
      case 'kk':
        _texts = AppTexts.kazakh;
        break;
      default:
        _texts = AppTexts.english;
    }
    notifyListeners();
  }
}
