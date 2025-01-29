import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class BaseUsecase<type,Parameters> {
  Future<Either<Failure,type>> call(Parameters parameters);
}
class NoParameters extends Equatable{
  const NoParameters();
  @override
  List<Object?> get props => [];
}