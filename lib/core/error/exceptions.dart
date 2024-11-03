// exceptions.dart

/// Custom exception for server-related errors
class ServerException implements Exception {}

/// Custom exception for local cache errors
class CacheException implements Exception {}

/// Custom exception for authentication errors
class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => "AuthException: $message";
}
