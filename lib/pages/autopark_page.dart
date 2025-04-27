import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/car.dart';
import '../services/database_helper.dart';
import 'car_details_page.dart';
import '../providers/app_text_provider.dart';
import 'package:provider/provider.dart';

class AutoparkPage extends StatefulWidget {
  const AutoparkPage({super.key});

  @override
  State<AutoparkPage> createState() => _AutoparkPageState();
}

class _AutoparkPageState extends State<AutoparkPage> {
  late Future<List<Car>> _carsFuture;
  List<Car> _cars = [];
  List<Car> _filteredCars = [];
  String _sortBy = 'price';
  bool _ascending = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCars();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadCars() {
    _carsFuture = DatabaseHelper.instance.getCars();
    _carsFuture.then((cars) {
      if (mounted) {
        setState(() {
          _cars = cars;
          _filteredCars = List.from(cars);
          _sortCars();
        });
      }
    });
  }

  void _filterCars(String query) {
    setState(() {
      _filteredCars = _cars.where((car) {
        return car.brand.toLowerCase().contains(query.toLowerCase()) ||
               car.year.toLowerCase().contains(query.toLowerCase()) ||
               car.price.toLowerCase().contains(query.toLowerCase());
      }).toList();
      _sortCars();
    });
  }

  void _sortCars() {
    setState(() {
      switch (_sortBy) {
        case 'price':
          _filteredCars.sort((a, b) {
            final priceA = int.parse(a.price.replaceAll(RegExp(r'[^0-9]'), ''));
            final priceB = int.parse(b.price.replaceAll(RegExp(r'[^0-9]'), ''));
            return _ascending ? priceA.compareTo(priceB) : priceB.compareTo(priceA);
          });
          break;
        case 'year':
          _filteredCars.sort((a, b) {
            final yearA = int.parse(a.year);
            final yearB = int.parse(b.year);
            return _ascending ? yearA.compareTo(yearB) : yearB.compareTo(yearA);
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<AppTextProvider>().texts.carPark),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search and Filter Bar
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: context.watch<AppTextProvider>().texts.searchCar,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: _filterCars,
                ).animate()
                 .fadeIn(duration: 600.ms)
                 .slideX(begin: -0.2),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(context.watch<AppTextProvider>().texts.sortBy),
                        DropdownButton<String>(
                          value: _sortBy,
                          items: [
                            DropdownMenuItem(
                              value: 'price',
                              child: const Text('Price'),
                            ),
                            DropdownMenuItem(
                              value: 'year',
                              child: const Text('Year'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _sortBy = value!;
                              _sortCars();
                            });
                          },
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(_ascending
                          ? Icons.arrow_upward
                          : Icons.arrow_downward),
                      onPressed: () {
                        setState(() {
                          _ascending = !_ascending;
                          _sortCars();
                        });
                      },
                      tooltip: _ascending ? context.watch<AppTextProvider>().texts.ascending : context.watch<AppTextProvider>().texts.descending,
                    ),
                  ],
                ).animate()
                 .fadeIn(duration: 600.ms)
                 .slideX(begin: 0.2),
              ],
            ),
          ),
          // Car Grid
          Expanded(
            child: FutureBuilder<List<Car>>(
              future: _carsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text(context.watch<AppTextProvider>().texts.noCarsAvailable));
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _filteredCars.length,
                  itemBuilder: (context, index) {
                    final car = _filteredCars[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarDetailsPage(car: car),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Hero(
                                tag: 'car-${car.id}',
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/cars/${car.imageName}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    car.brand,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Год: ${car.year}',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${car.price} ₸/день',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate()
                     .fadeIn(delay: Duration(milliseconds: 100 * index))
                     .slideY(begin: 0.2);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
