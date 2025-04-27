import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ?? AppLocalizations(const Locale('ru'));
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Car Rental',
      'settings': 'Settings',
      'dark_theme': 'Dark Theme',
      'language': 'Language',
      'home': 'Home',
      'autopark': 'Car Park',
      'profile': 'Profile',
      'admin': 'Admin',
      'rent_car': 'Rent a Car',
      'available_cars': 'Available Cars',
      'car_details': 'Car Details',
      'book_now': 'Book Now',
      'select_dates': 'Select Dates',
      'price_per_day': 'Price per Day',
      'total_price': 'Total Price',
      'confirm_booking': 'Confirm Booking',
      // Admin Page
      'admin_panel': 'Admin Panel',
      'manage_cars': 'Manage Car Park',
      'manage_bookings': 'Manage Bookings',
      'manage_profiles': 'Manage Profiles',
      // Autopark Page
      'car_park': 'Car Park',
      'search_car': 'Search for a car...',
      'sort_by': 'Sort by: ',
      'price': 'Price',
      'year': 'Year',
      'ascending': 'Ascending',
      'descending': 'Descending',
      'no_cars_available': 'No cars available',
      'brand': 'Brand',
      'model': 'Model',
      'details': 'Details',
      // Car Details
      'specifications': 'Specifications',
      'engine': 'Engine',
      'transmission': 'Transmission',
      'fuel_type': 'Fuel Type',
      'body_type': 'Body Type',
      'seats': 'Seats',
      'features': 'Features',
      'description': 'Description',
      'about_company': 'About Our Company',
      'cars': 'Cars',
      'clients': 'Clients',
      'rating': 'Rating',
      'popular_cars': 'Popular Cars',
      'view_all': 'View All',
      'error': 'An error occurred',
      // Booking
      'start_date': 'Start Date',
      'end_date': 'End Date',
      'booking_details': 'Booking Details',
      'days': 'Days',
      'total': 'Total',
      'payment_method': 'Payment Method',
      'card': 'Card',
      'cash': 'Cash',
    },
    'ru': {
      'app_title': 'Аренда авто',
      'settings': 'Настройки',
      'dark_theme': 'Тёмная тема',
      'language': 'Язык',
      'home': 'Главная',
      'autopark': 'Автопарк',
      'profile': 'Профиль',
      'admin': 'Админ',
      'rent_car': 'Арендовать авто',
      'available_cars': 'Доступные авто',
      'car_details': 'Детали авто',
      'book_now': 'Забронировать',
      'select_dates': 'Выберите даты',
      'price_per_day': 'Цена за день',
      'total_price': 'Итоговая цена',
      'confirm_booking': 'Подтвердить бронь',
      // Admin Page
      'admin_panel': 'Админ панель',
      'manage_cars': 'Управление автопарком',
      'manage_bookings': 'Управление бронированием',
      'manage_profiles': 'Управление профилями',
      // Autopark Page
      'car_park': 'Автопарк',
      'search_car': 'Поиск автомобиля...',
      'sort_by': 'Сортировать по: ',
      'price': 'Цене',
      'year': 'Году',
      'ascending': 'По возрастанию',
      'descending': 'По убыванию',
      'no_cars_available': 'Нет доступных автомобилей',
      'brand': 'Марка',
      'model': 'Модель',
      'details': 'Подробнее',
      // Car Details
      'specifications': 'Характеристики',
      'engine': 'Двигатель',
      'transmission': 'Коробка передач',
      'fuel_type': 'Тип топлива',
      'body_type': 'Тип кузова',
      'seats': 'Мест',
      'features': 'Особенности',
      'description': 'Описание',
      'about_company': 'О нашей компании',
      'cars': 'Автомобилей',
      'clients': 'Клиентов',
      'rating': 'Рейтинг',
      'popular_cars': 'Популярные автомобили',
      'view_all': 'Посмотреть все',
      'error': 'Произошла ошибка',
      // Booking
      'start_date': 'Дата начала',
      'end_date': 'Дата окончания',
      'booking_details': 'Детали бронирования',
      'days': 'Дней',
      'total': 'Итого',
      'payment_method': 'Способ оплаты',
      'card': 'Картой',
      'cash': 'Наличными',
    },
    'kk': {
      'app_title': 'Авто жалдау',
      'settings': 'Параметрлер',
      'dark_theme': 'Қараңғы тақырып',
      'language': 'Тіл',
      'home': 'Басты бет',
      'autopark': 'Автопарк',
      'profile': 'Профиль',
      'admin': 'Әкімші',
      'rent_car': 'Авто жалдау',
      'available_cars': 'Қолжетімді көліктер',
      'car_details': 'Көлік мәліметтері',
      'book_now': 'Брондау',
      'select_dates': 'Күндерді таңдаңыз',
      'price_per_day': 'Күндік баға',
      'total_price': 'Жалпы баға',
      'confirm_booking': 'Брондауды растау',
      // Admin Page
      'admin_panel': 'Әкімші панелі',
      'manage_cars': 'Автопаркті басқару',
      'manage_bookings': 'Брондауларды басқару',
      'manage_profiles': 'Профильдерді басқару',
      // Autopark Page
      'car_park': 'Автопарк',
      'search_car': 'Көлік іздеу...',
      'sort_by': 'Сұрыптау: ',
      'price': 'Баға',
      'year': 'Жыл',
      'ascending': 'Өсу бойынша',
      'descending': 'Кему бойынша',
      'no_cars_available': 'Қолжетімді көліктер жоқ',
      'brand': 'Марка',
      'model': 'Үлгі',
      'details': 'Толығырақ',
      // Car Details
      'specifications': 'Сипаттамалары',
      'engine': 'Қозғалтқыш',
      'transmission': 'Беріліс қорабы',
      'fuel_type': 'Отын түрі',
      'body_type': 'Кузов түрі',
      'seats': 'Орындар',
      'features': 'Ерекшеліктері',
      'description': 'Сипаттама',
      'about_company': 'Біздің компания туралы',
      'cars': 'Көліктер',
      'clients': 'Клиенттер',
      'rating': 'Рейтинг',
      'popular_cars': 'Танымал көліктер',
      'view_all': 'Барлығын көру',
      'error': 'Қате пайда болды',
      // Booking
      'start_date': 'Басталу күні',
      'end_date': 'Аяқталу күні',
      'booking_details': 'Брондау мәліметтері',
      'days': 'Күн',
      'total': 'Барлығы',
      'payment_method': 'Төлем әдісі',
      'card': 'Картамен',
      'cash': 'Қолма-қол',
    },
    'en': {
      'app_title': 'Car Rental',
      'settings': 'Settings',
      'dark_theme': 'Dark Theme',
      'language': 'Language',
      'home': 'Home',
      'autopark': 'Car Park',
      'profile': 'Profile',
      'admin': 'Admin',
      'rent_car': 'Rent a Car',
      'available_cars': 'Available Cars',
      'car_details': 'Car Details',
      'book_now': 'Book Now',
      'select_dates': 'Select Dates',
      'price_per_day': 'Price per Day',
      'total_price': 'Total Price',
      'confirm_booking': 'Confirm Booking',
    },
    'ru': {
      'app_title': 'Аренда авто',
      'settings': 'Настройки',
      'dark_theme': 'Тёмная тема',
      'language': 'Язык',
      'home': 'Главная',
      'autopark': 'Автопарк',
      'profile': 'Профиль',
      'admin': 'Админ',
      'rent_car': 'Арендовать авто',
      'available_cars': 'Доступные авто',
      'car_details': 'Детали авто',
      'book_now': 'Забронировать',
      'select_dates': 'Выберите даты',
      'price_per_day': 'Цена за день',
      'total_price': 'Итоговая цена',
      'confirm_booking': 'Подтвердить бронь',
    },
    'kk': {
      'app_title': 'Авто жалдау',
      'settings': 'Параметрлер',
      'dark_theme': 'Қараңғы тақырып',
      'language': 'Тіл',
      'home': 'Басты бет',
      'autopark': 'Автопарк',
      'profile': 'Профиль',
      'admin': 'Әкімші',
      'rent_car': 'Авто жалдау',
      'available_cars': 'Қолжетімді көліктер',
      'car_details': 'Көлік мәліметтері',
      'book_now': 'Брондау',
      'select_dates': 'Күндерді таңдаңыз',
      'price_per_day': 'Күндік баға',
      'total_price': 'Жалпы баға',
      'confirm_booking': 'Брондауды растау',
    },
  };

  String get appTitle => _localizedValues[locale.languageCode]!['app_title']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get darkTheme => _localizedValues[locale.languageCode]!['dark_theme']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get autopark => _localizedValues[locale.languageCode]!['autopark']!;
  String get profile => _localizedValues[locale.languageCode]!['profile']!;
  String get admin => _localizedValues[locale.languageCode]!['admin']!;
  String get rentCar => _localizedValues[locale.languageCode]!['rent_car']!;
  String get availableCars => _localizedValues[locale.languageCode]!['available_cars']!;
  String get carDetails => _localizedValues[locale.languageCode]!['car_details']!;
  String get bookNow => _localizedValues[locale.languageCode]!['book_now']!;
  String get selectDates => _localizedValues[locale.languageCode]!['select_dates']!;
  String get pricePerDay => _localizedValues[locale.languageCode]!['price_per_day']!;
  String get totalPrice => _localizedValues[locale.languageCode]!['total_price']!;
  String get confirmBooking => _localizedValues[locale.languageCode]!['confirm_booking']!;

  // Admin Page
  String get adminPanel => _localizedValues[locale.languageCode]!['admin_panel']!;
  String get manageCars => _localizedValues[locale.languageCode]!['manage_cars']!;
  String get manageBookings => _localizedValues[locale.languageCode]!['manage_bookings']!;
  String get manageProfiles => _localizedValues[locale.languageCode]!['manage_profiles']!;

  // Autopark Page
  String get carPark => _localizedValues[locale.languageCode]!['car_park']!;
  String get searchCar => _localizedValues[locale.languageCode]!['search_car']!;
  String get sortBy => _localizedValues[locale.languageCode]!['sort_by']!;
  String get price => _localizedValues[locale.languageCode]!['price']!;
  String get year => _localizedValues[locale.languageCode]!['year']!;
  String get ascending => _localizedValues[locale.languageCode]!['ascending']!;
  String get descending => _localizedValues[locale.languageCode]!['descending']!;
  String get noCarsAvailable => _localizedValues[locale.languageCode]!['no_cars_available']!;
  String get brand => _localizedValues[locale.languageCode]!['brand']!;
  String get model => _localizedValues[locale.languageCode]!['model']!;
  String get details => _localizedValues[locale.languageCode]!['details']!;

  // Car Details
  String get specifications => _localizedValues[locale.languageCode]!['specifications']!;
  String get engine => _localizedValues[locale.languageCode]!['engine']!;
  String get transmission => _localizedValues[locale.languageCode]!['transmission']!;
  String get fuelType => _localizedValues[locale.languageCode]!['fuel_type']!;
  String get bodyType => _localizedValues[locale.languageCode]!['body_type']!;
  String get seats => _localizedValues[locale.languageCode]!['seats']!;
  String get features => _localizedValues[locale.languageCode]!['features']!;
  String get description => _localizedValues[locale.languageCode]!['description']!;
  String get aboutCompany => _localizedValues[locale.languageCode]!['about_company']!;
  String get cars => _localizedValues[locale.languageCode]!['cars']!;
  String get clients => _localizedValues[locale.languageCode]!['clients']!;
  String get rating => _localizedValues[locale.languageCode]!['rating']!;
  String get popularCars => _localizedValues[locale.languageCode]!['popular_cars']!;
  String get viewAll => _localizedValues[locale.languageCode]!['view_all']!;
  String get error => _localizedValues[locale.languageCode]!['error']!;

  // Booking
  String get startDate => _localizedValues[locale.languageCode]!['start_date']!;
  String get endDate => _localizedValues[locale.languageCode]!['end_date']!;
  String get bookingDetails => _localizedValues[locale.languageCode]!['booking_details']!;
  String get days => _localizedValues[locale.languageCode]!['days']!;
  String get total => _localizedValues[locale.languageCode]!['total']!;
  String get paymentMethod => _localizedValues[locale.languageCode]!['payment_method']!;
  String get card => _localizedValues[locale.languageCode]!['card']!;
  String get cash => _localizedValues[locale.languageCode]!['cash']!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'kk'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
