import 'package:clean_architecture_app/features/number_trivia/domain/entities/number_trivia_entities.dart';
import 'package:clean_architecture_app/core/error/failures_interface.dart';
import 'package:clean_architecture_app/features/number_trivia/domain/repository/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class NumberTriviaRepositoryImplements implements NumberTriviaRepository {
  @override
  Future<Either<Failures, NumberEntities>> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, NumberEntities>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}
