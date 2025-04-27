import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/car.dart';
import '../theme/app_theme.dart';
import '../providers/app_text_provider.dart';
import 'package:provider/provider.dart';
import 'booking_page.dart';

class CarDetailsPage extends StatelessWidget {
  final Car car;

  const CarDetailsPage({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    final texts = context.watch<AppTextProvider>().texts;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                car.brand,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              background: Hero(
                tag: 'car-${car.id}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/cars/${car.imageName}',
                      fit: BoxFit.cover,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailCard(context),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(car: car),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        texts.bookNow,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ).animate()
                   .fadeIn(delay: 800.ms)
                   .slideY(begin: 0.2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard(BuildContext context) {
    final texts = context.watch<AppTextProvider>().texts;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              texts.specifications,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 16),
            _buildDetailRow(
              context,
              texts.price,
              '${car.price} ₸/день',
              Icons.attach_money,
            ),
            Divider(height: 24),
            _buildDetailRow(
              context,
              texts.year,
              car.year,
              Icons.calendar_today,
            ),
            Divider(height: 24),
            _buildDetailRow(
              context,
              texts.seats,
              car.seats,
              Icons.airline_seat_recline_normal,
            ),
            Divider(height: 24),
            _buildDetailRow(
              context,
              texts.transmission,
              car.transmission,
              Icons.settings,
            ),
            Divider(height: 24),
            _buildDetailRow(
              context,
              texts.bodyType,
              car.body,
              Icons.directions_car,
            ),
            Divider(height: 24),
            _buildDetailRow(
              context,
              texts.fuelType,
              car.fuel,
              Icons.local_gas_station,
            ),
          ],
        ),
      ),
    ).animate()
     .fadeIn(delay: 400.ms)
     .slideX(begin: 0.2);
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
