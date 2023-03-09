import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  // entity is used if we need more complex data for our usecases

  final int id;
  final String advice;

  const AdviceEntity({required this.id, required this.advice});

  @override
  List<Object?> get props => [id, advice];
  // fill this list with what you want to compare using equatable
}
