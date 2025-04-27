import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/user.dart';
import 'dart:convert';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _isRegistering = false;
  User? _currentUser;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      if (_isRegistering) {
        // Создаем нового пользователя
        final user = User(
          name: _nameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          phone: _phoneController.text,
        );

        // Вывод информации о пользователе в консоль
        print(jsonEncode(user.toMap()));

        setState(() {
          _currentUser = user;
        });
      } else {
        // В реальном приложении здесь была бы проверка credentials
        setState(() {
          _currentUser = User(
            name: 'Тестовый',
            lastName: 'Пользователь',
            email: _emailController.text,
            password: _passwordController.text,
            phone: '+7 777 777 7777',
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser != null) {
      return _buildUserProfile();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_isRegistering ? 'Регистрация' : 'Вход'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_isRegistering) ...[
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Имя',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите имя';
                    }
                    return null;
                  },
                ).animate()
                 .fadeIn(delay: 200.ms)
                 .slideX(begin: 0.2),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Фамилия',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите фамилию';
                    }
                    return null;
                  },
                ).animate()
                 .fadeIn(delay: 300.ms)
                 .slideX(begin: 0.2),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Телефон',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите телефон';
                    }
                    return null;
                  },
                ).animate()
                 .fadeIn(delay: 400.ms)
                 .slideX(begin: 0.2),

                const SizedBox(height: 16),
              ],

              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите email';
                  }
                  if (!value.contains('@')) {
                    return 'Пожалуйста, введите корректный email';
                  }
                  return null;
                },
              ).animate()
               .fadeIn(delay: 500.ms)
               .slideX(begin: 0.2),

              const SizedBox(height: 16),

              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите пароль';
                  }
                  if (value.length < 6) {
                    return 'Пароль должен быть не менее 6 символов';
                  }
                  return null;
                },
              ).animate()
               .fadeIn(delay: 600.ms)
               .slideX(begin: 0.2),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  _isRegistering ? 'Зарегистрироваться' : 'Войти',
                  style: const TextStyle(fontSize: 18),
                ),
              ).animate()
               .fadeIn(delay: 700.ms)
               .slideY(begin: 0.2),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  setState(() {
                    _isRegistering = !_isRegistering;
                  });
                },
                child: Text(
                  _isRegistering
                      ? 'Уже есть аккаунт? Войти'
                      : 'Нет аккаунта? Зарегистрироваться',
                ),
              ).animate()
               .fadeIn(delay: 800.ms),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              setState(() {
                _currentUser = null;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                _currentUser!.name[0],
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ).animate()
             .fadeIn(delay: 200.ms)
             .scale(begin: const Offset(0.5, 0.5)),

            const SizedBox(height: 24),

            Text(
              'Добро пожаловать,',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ).animate()
             .fadeIn(delay: 400.ms)
             .slideY(begin: 0.2),

            Text(
              '${_currentUser!.name} ${_currentUser!.lastName}',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Colors.grey[600],
              ),
            ).animate()
             .fadeIn(delay: 500.ms)
             .slideY(begin: 0.2),

            const SizedBox(height: 32),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildProfileRow(
                      Icons.email,
                      'Email',
                      _currentUser!.email,
                    ),
                    const Divider(),
                    _buildProfileRow(
                      Icons.phone,
                      'Телефон',
                      _currentUser!.phone,
                    ),
                  ],
                ),
              ),
            ).animate()
             .fadeIn(delay: 600.ms)
             .slideX(begin: 0.2),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
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
          ),
        ],
      ),
    );
  }
}
