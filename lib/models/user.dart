class UserModel {
  final String id;
  final String email;
  final String fullName;
  final String? phoneNumber;
  final List<String> bookings;
  final String? profileImageUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.phoneNumber,
    this.bookings = const [],
    this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      bookings: List<String>.from(json['bookings'] as List? ?? []),
      profileImageUrl: json['profileImageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'bookings': bookings,
      'profileImageUrl': profileImageUrl,
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? fullName,
    String? phoneNumber,
    List<String>? bookings,
    String? profileImageUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bookings: bookings ?? this.bookings,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
