import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(AdviceInitial());
  final AdviceUsecases adviceUsecases = AdviceUsecases();
  // cubit cand use multiple usecases, eg: AuthenticationUsecases and other usecases

  void adviceRequest() async {
    // execute business logic, example: get and advice
    emit(AdviceStateLoading());
    final AdviceEntity advice = await adviceUsecases.getAdvice();

    emit(AdviceStateLoaded(advice: advice.advice));
  }
}
