// user.dart

import 'package:equatable/equatable.dart';

/// Entity representing a user within the application
class User extends Equatable {
  final String email;
  final String password;
  final String role; // 'student' or 'teacher'

  const User({
    required this.email,
    required this.password,
    required this.role,
  });

  @override
  List<Object?> get props => [email, role];
}
