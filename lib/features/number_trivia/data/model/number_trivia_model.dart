import 'package:clean_architecture_app/features/number_trivia/domain/entities/number_trivia_entities.dart';

// ini untuk model yang akan diambil dari data_source
class NumberTriviaModel extends NumberEntities {
  const NumberTriviaModel({
    String? text,
    int? number,
  }) : super(text: text, number: number);

  // from json
  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: (json['number'] as num).toInt(),
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}
