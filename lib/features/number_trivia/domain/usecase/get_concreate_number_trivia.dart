import 'package:clean_architecture_app/core/error/failures_interface.dart';
import 'package:clean_architecture_app/core/usecase/usecase_interface.dart';
import 'package:clean_architecture_app/features/number_trivia/domain/entities/number_trivia_entities.dart';
import 'package:clean_architecture_app/features/number_trivia/domain/repository/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetConcreateNumberTrivia implements UserCase<NumberEntities, Params> {
  final NumberTriviaRepository? repository;

  GetConcreateNumberTrivia({this.repository});

  // MELAKUKAN OVERRIDE DARI ABSTRACT CLASS USERCASE
  // @override
  // Future<Either<Failures, NumberEntities>> execute(int? number) async {
  //   // TODO: implement execute
  //   return await repository!.getConcreteNumberTrivia(number!);
  // }

  /* 
  MELAKUKAN OVERRIDE DARI ABSTRACT CLASS USERCASE MENGGUNAKAN
  PARAMETER DARI CLASS PARAMS 
  
  */
  @override
  Future<Either<Failures, NumberEntities>> execute(Params params) async {
    return await repository!.getConcreteNumberTrivia(params.number!);
  }
}

// APABILA INGIN MENGGUNAKAN CLASS UNTUK PARAMETER NUMBER PADA FUNGSI DIATAS
class Params extends Equatable {
  final int? number;

  const Params(this.number);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
