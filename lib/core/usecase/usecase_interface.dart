import 'package:clean_architecture_app/core/error/failures_interface.dart';
import 'package:dartz/dartz.dart';

abstract class UserCase<Type, Params> {
  Future<Either<Failures, Type>> execute(Params params);
}
