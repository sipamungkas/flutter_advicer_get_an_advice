import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(
        AdviceStateLoading(),
      );
      // execute business logic, example: get and advice
      debugPrint('fake get advice trigger');
      await Future.delayed(const Duration(seconds: 2), () {});
      debugPrint('got advice');
      emit(
        AdviceStateLoaded(
            advice: 'Advice from server but it\'s fake, just to test the bloc'),
      );
    });
  }
}
