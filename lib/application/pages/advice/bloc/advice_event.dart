part of 'advice_bloc.dart';

@immutable
abstract class AdviceEvent extends Equatable {}

class AdviceRequestedEvent extends AdviceEvent {
  @override
  List<Object?> get props => [];
}
