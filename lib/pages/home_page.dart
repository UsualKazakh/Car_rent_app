import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/car.dart';
import '../services/database_helper.dart';
import 'autopark_page.dart';
import 'car_details_page.dart';
import '../providers/app_text_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Car>> _featuredCars;

  @override
  void initState() {
    super.initState();
    _featuredCars = DatabaseHelper.instance.getCars();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTextProvider>(
      builder: (context, textProvider, child) {
        final texts = textProvider.texts;
        return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            Stack(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        texts.rentCar,
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ).animate()
                       .fadeIn(duration: 600.ms)
                       .slideX(begin: -0.3),
                      const SizedBox(height: 8),
                      Text(
                        texts.availableCars,
                        style: GoogleFonts.montserrat(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ).animate()
                       .fadeIn(duration: 800.ms)
                       .slideX(begin: -0.3),
                      const SizedBox(height: 16),
                      Text(
                        texts.bookNow,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ).animate()
                       .fadeIn(duration: 1000.ms)
                       .slideX(begin: -0.3),
                    ],
                  ),
                ),
              ],
            ),

            // Company Info Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    texts.aboutCompany,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ).animate()
                   .fadeIn(duration: 600.ms)
                   .slideX(begin: 0.3),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoCard(
                        icon: Icons.car_rental,
                        title: '50+',
                        subtitle: texts.cars,
                      ),
                      _buildInfoCard(
                        icon: Icons.people,
                        title: '1000+',
                        subtitle: texts.clients,
                      ),
                      _buildInfoCard(
                        icon: Icons.star,
                        title: '4.9',
                        subtitle: texts.rating,
                      ),
                    ],
                  ).animate()
                   .fadeIn(duration: 800.ms)
                   .slideY(begin: 0.3),
                ],
              ),
            ),

            // Featured Cars Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    texts.popularCars,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ).animate()
                   .fadeIn(duration: 600.ms),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AutoparkPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: Text(texts.viewAll),
                  ).animate()
                   .fadeIn(duration: 700.ms),
                  const SizedBox(height: 24),
                  FutureBuilder<List<Car>>(
                    future: _featuredCars,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text(texts.noCarsAvailable));
                      }
                      final cars = snapshot.data?.take(4).toList() ?? [];
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: cars.length,
                        itemBuilder: (context, index) {
                          final car = cars[index];
                          return _buildCarCard(context, car, index);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
      },
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate()
     .fadeIn(delay: 500.ms)
     .slideY(begin: 0.2);
  }

  Widget _buildCarCard(BuildContext context, Car car, int index) {
    final texts = Provider.of<AppTextProvider>(context).texts;
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
                      image: AssetImage('assets/images/cars/${car.imageName}'),
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
                    '${texts.year}: ${car.year}',
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
     .fadeIn(delay: Duration(milliseconds: 200 * index))
     .slideY(begin: 0.3, delay: Duration(milliseconds: 200 * index));
  }
}
