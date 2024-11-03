// auth_remote_data_source.dart

import '../../core/error/exceptions.dart';

abstract class AuthRemoteDataSource {
  /// Logs in a user with email and password
  /// Throws [AuthException] if login fails
  Future<void> login(String email, String password);

  /// Logs out the currently authenticated user
  Future<void> logout();

  /// Checks if a user is currently authenticated
  Future<bool> isAuthenticated();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // Mock data for user accounts
  final Map<String, String> mockUsers = {
    'student@example.com': 'password123',
    'teacher@example.com': 'password456',
  };

  String? _currentUserEmail;

  @override
  Future<void> login(String email, String password) async {
    if (mockUsers.containsKey(email) && mockUsers[email] == password) {
      _currentUserEmail = email;
    } else {
      throw AuthException("Invalid email or password");
    }
  }

  @override
  Future<void> logout() async {
    _currentUserEmail = null;
  }

  @override
  Future<bool> isAuthenticated() async {
    return _currentUserEmail != null;
  }
}
