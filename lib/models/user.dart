class User {
  final int? id;
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String phone;

  User({
    this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int?,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
    );
  }

  User copyWith({
    int? id,
    String? name,
    String? lastName,
    String? email,
    String? password,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
