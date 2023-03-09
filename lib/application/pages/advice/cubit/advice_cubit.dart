import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(AdviceInitial());

  void adviceRequest() async {
    emit(
      AdviceStateLoading(),
    );
    // execute business logic, example: get and advice
    debugPrint('fake get advice trigger');
    await Future.delayed(const Duration(seconds: 2), () {});
    debugPrint('got advice');
    emit(
      const AdviceStateLoaded(
          advice: 'Advice from server but it\'s fake, just to test the cubit'),
    );
  }
}
