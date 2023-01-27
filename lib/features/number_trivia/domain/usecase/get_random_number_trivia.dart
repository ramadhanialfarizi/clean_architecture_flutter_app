import 'package:clean_architecture_app/core/error/failures_interface.dart';
import 'package:clean_architecture_app/core/usecase/usecase_interface.dart';
import 'package:clean_architecture_app/features/number_trivia/domain/entities/number_trivia_entities.dart';
import 'package:clean_architecture_app/features/number_trivia/domain/repository/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomNumberTrivia implements UserCase<NumberEntities, NoParams> {
  NumberTriviaRepository? repository;

  @override
  Future<Either<Failures, NumberEntities>> execute(NoParams noParams) async {
    return await repository!.getRandomNumberTrivia();
  }
}

class NoParams extends Equatable {
  // FUNGSI DIBAWAH TIDAK DI PAKAI
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
