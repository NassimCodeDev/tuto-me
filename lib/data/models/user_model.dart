// user_model.dart

import '../../domain/entities/user.dart';

/// UserModel represents a user within the application, either a student or teacher
class UserModel extends User {
  UserModel({
    required String email,
    required String password,
    required String role,
  }) : super(
          email: email,
          password: password,
          role: role,
        );

  /// Creates a UserModel from a Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? 'student', // default role is 'student'
    );
  }

  /// Converts UserModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
