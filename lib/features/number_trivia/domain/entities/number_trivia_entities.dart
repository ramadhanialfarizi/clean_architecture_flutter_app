import 'package:equatable/equatable.dart';

// DATA DISINI AKAN DIPAKAI DI PRESENTATION
class NumberEntities extends Equatable {
  final String? text;
  final int? number;

  const NumberEntities({
    this.text,
    this.number,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
