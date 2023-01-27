import 'package:clean_architecture_app/core/error/failures_interface.dart';
import 'package:clean_architecture_app/features/number_trivia/domain/entities/number_trivia_entities.dart';
import 'package:dartz/dartz.dart';

/*
METHOD ABSTRACT CLASS DI SINI AKAN DI WARISKAN KEPADA REPOSITORY 
YANG ADA DI FOLDER DATA 
 
*/
abstract class NumberTriviaRepository {
  Future<Either<Failures, NumberEntities>> getConcreteNumberTrivia(int number);
  Future<Either<Failures, NumberEntities>> getRandomNumberTrivia();
}
