import 'package:clean_architecture_app/features/number_trivia/data/model/number_trivia_model.dart';

abstract class NumberTriviaLocalDatasource {
  /// fungsi ini untuk mengambil chache data [NumberTriviaModel] terakhir
  /// saat user tidak memiliki koneksi internet

  /// throw [CacheException] jika datanya tidak ada
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> chaceNumberTrivia(NumberTriviaModel triviaToCache);
}
