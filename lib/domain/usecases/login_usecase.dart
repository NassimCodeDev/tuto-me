// login_usecase.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

/// Use case for user login
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  /// Executes the login operation
  /// Returns [Failure] if unsuccessful, or void if successful
  Future<Either<Failure, void>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
