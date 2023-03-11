import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/usecases/advice_usecases.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'advice_state.dart';

const generalFailureMessage = 'Oops! Something went wrong, Plase try again!';
const serverFailureMessage = 'Server under maintenance!';
const cacheFailureMessage = 'Oops! Cache failure, Please try again!';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(AdviceInitial());
  final AdviceUsecases adviceUsecases = AdviceUsecases();
  // cubit cand use multiple usecases, eg: AuthenticationUsecases and other usecases

  void adviceRequest(int adviceId) async {
    // execute business logic, example: get and advice
    emit(AdviceStateLoading());
    // dont need to add type it will get from the usecase
    final failureOrAdvice = await adviceUsecases.getAdvice(adviceId);
    // fold will decide, if we got the left(failure) side or the right(advice) side from Failure Dartz
    failureOrAdvice.fold(
      (failure) {
        emit(AdviceStateError(message: _mapFailureToMessage(failure)));
      },
      (advice) => emit(
        AdviceStateLoaded(advice: advice.advice),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
