import 'package:clean_architecture_app/core/error/exception.dart';
import 'package:clean_architecture_app/core/network/network_info.dart';
import 'package:clean_architecture_app/features/number_trivia/data/data_source/number_trivia_local_datasource.dart';
import 'package:clean_architecture_app/features/number_trivia/data/data_source/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_app/features/number_trivia/domain/entities/number_trivia_entities.dart';
import 'package:clean_architecture_app/core/error/failures_interface.dart';
import 'package:clean_architecture_app/features/number_trivia/domain/repository/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class NumberTriviaRepositoryImplements implements NumberTriviaRepository {
  NumberTriviaRemoteDataSource? remoteDataSource;
  NumberTriviaLocalDatasource? localDataSource;
  NetworkInfo? networkInfo;

  NumberTriviaRepositoryImplements({
    this.remoteDataSource,
    this.localDataSource,
    this.networkInfo,
  });

  @override
  Future<Either<Failures, NumberEntities>> getConcreteNumberTrivia(
      int number) async {
    if (await networkInfo!.isConnected) {
      try {
        final remoteTrivia =
            await remoteDataSource!.getConcreteNumberTrivia(number);
        localDataSource!.chaceNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerExeption {
        return Left(ServerFailures());
      }
    } else {
      try {
        final localTrivia = await localDataSource!.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheExeption {
        return Left(CacheFailures());
      }
    }

    // return await _getTrivia(
    //     () => remoteDataSource!.getConcreteNumberTrivia(number));
  }

  @override
  Future<Either<Failures, NumberEntities>> getRandomNumberTrivia() async {
    if (await networkInfo!.isConnected) {
      try {
        final remoteTrivia = await remoteDataSource!.getRandomNumberTrivia();
        localDataSource!.chaceNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerExeption {
        return Left(ServerFailures());
      }
    } else {
      try {
        final localTrivia = await localDataSource!.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheExeption {
        return Left(CacheFailures());
      }
    }

    //return await _getTrivia(() => remoteDataSource!.getRandomNumberTrivia());
  }

  // Future<Either<Failures, NumberEntities>> _getTrivia(
  //   Future<NumberEntities> Function() getConcretOrRandom,
  // ) async {
  //   if (await networkInfo!.isConnected) {
  //     try {
  //       final remoteTrivia = await getConcretOrRandom();
  //       localDataSource!.chaceNumberTrivia(remoteTrivia);
  //       return Right(remoteTrivia);
  //     } on ServerExeption {
  //       return Left(ServerFailures());
  //     }
  //   } else {
  //     try {
  //       final localTrivia = await localDataSource!.getLastNumberTrivia();
  //       return Right(localTrivia);
  //     } on CacheExeption {
  //       return Left(CacheFailures());
  //     }
  //   }
  // }
}
