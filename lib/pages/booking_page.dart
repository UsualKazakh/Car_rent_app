import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/car.dart';
import '../models/booking.dart';
import 'dart:convert';
import '../providers/app_text_provider.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  final Car car;

  const BookingPage({
    super.key,
    required this.car,
  });

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<AppTextProvider>().texts.bookingDetails),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/cars/${widget.car.imageName}',
                      height: 80,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.car.brand,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${widget.car.price} тг/день',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).animate()
             .fadeIn(delay: 200.ms)
             .slideX(begin: 0.2),

            SizedBox(height: 24),
            
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(Duration(days: 365)),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return _startDate != null && _endDate != null &&
                           day.isAfter(_startDate!.subtract(Duration(days: 1))) &&
                           day.isBefore(_endDate!.add(Duration(days: 1)));
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      if (_startDate == null || (_startDate != null && _endDate != null)) {
                        _startDate = selectedDay;
                        _endDate = null;
                      } else {
                        if (selectedDay.isBefore(_startDate!)) {
                          _endDate = _startDate;
                          _startDate = selectedDay;
                        } else {
                          _endDate = selectedDay;
                        }
                      }
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ),
            ).animate()
             .fadeIn(delay: 400.ms)
             .slideY(begin: 0.2),

            SizedBox(height: 24),

            if (_startDate != null && _endDate != null)
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.watch<AppTextProvider>().texts.bookingDetails,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildDetailRow(context.watch<AppTextProvider>().texts.startDate, _formatDate(_startDate!)),
                      SizedBox(height: 8),
                      _buildDetailRow(context.watch<AppTextProvider>().texts.endDate, _formatDate(_endDate!)),
                      SizedBox(height: 8),
                      _buildDetailRow(
                        context.watch<AppTextProvider>().texts.days,
                        _endDate!.difference(_startDate!).inDays.toString(),
                      ),
                      SizedBox(height: 8),
                      _buildDetailRow(
                        context.watch<AppTextProvider>().texts.total,
                        '${int.parse(widget.car.price) * _endDate!.difference(_startDate!).inDays} тг',
                      ),
                    ],
                  ),
                ),
              ).animate()
               .fadeIn(delay: 600.ms)
               .slideY(begin: 0.2),

            SizedBox(height: 24),

            if (_startDate != null && _endDate != null)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final booking = Booking(
                      userId: 1, // Здесь должен быть ID текущего пользователя
                      carId: widget.car.id ?? 1,
                      startDate: _startDate!,
                      endDate: _endDate!,
                      totalPrice: int.parse(widget.car.price) * 
                                _endDate!.difference(_startDate!).inDays.toDouble(),
                    );
                    
                    // Вывод информации о бронировании в консоль
                    print(jsonEncode(booking.toMap()));
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.read<AppTextProvider>().texts.confirmBooking),
                        backgroundColor: Colors.green,
                      ),
                    );
                    
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    context.watch<AppTextProvider>().texts.bookNow,
                    style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                  ),
                )
              ).animate()
               .fadeIn(delay: 800.ms)
               .slideY(begin: 0.2),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
