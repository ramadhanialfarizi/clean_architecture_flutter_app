import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  const Failures([List properties = const <dynamic>[]]);
}

class ServerFailures extends Failures {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailures extends Failures {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
