// failures.dart

import 'package:equatable/equatable.dart';

/// Base class for all possible failures in the application
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

/// Failure due to server issues, such as a 500 status code
class ServerFailure extends Failure {}

/// Failure due to no internet connection or server unreachability
class NetworkFailure extends Failure {}

/// Failure related to authentication, e.g., invalid credentials
class AuthFailure extends Failure {
  final String message;

  AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

/// Failure related to local cache or storage issues
class CacheFailure extends Failure {}
