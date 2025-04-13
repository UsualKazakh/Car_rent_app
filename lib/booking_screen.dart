import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String carName;
  final String carPrice;

  BookingScreen({required this.carName, required this.carPrice});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Бронирование ${widget.carName}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Ваше имя'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите имя';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_startDate == null ? 'Начало аренды' : _startDate.toString().split(' ')[0]),
                  ElevatedButton(
                    onPressed: () => _selectDate(context, true),
                    child: Text('Выбрать дату'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_endDate == null ? 'Конец аренды' : _endDate.toString().split(' ')[0]),
                  ElevatedButton(
                    onPressed: () => _selectDate(context, false),
                    child: Text('Выбрать дату'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _startDate != null && _endDate != null) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Машина ${widget.carName} забронирована!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text('Подтвердить бронирование'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}