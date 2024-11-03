// usecase.dart

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

/// The base class for all use cases in the application.
/// It expects a type [Type] for the return value, and [Params] as the input parameter(s).
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case with no parameters.
/// Typically used for read-only operations that don’t require any input.
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
