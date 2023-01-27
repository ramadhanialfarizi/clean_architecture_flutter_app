import 'package:clean_architecture_app/core/error/failures_interface.dart';
import 'package:clean_architecture_app/features/number_trivia/domain/entities/number_trivia_entities.dart';
import 'package:dartz/dartz.dart';

abstract class UserCase<Type, Params> {
  Future<Either<Failures, Type>> execute();
}
