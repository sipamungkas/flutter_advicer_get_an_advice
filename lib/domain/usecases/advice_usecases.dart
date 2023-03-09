import 'package:advicer/domain/entities/advice_entity.dart';

class AdviceUsecases {
  // usecases is just a collection of method

  Future<AdviceEntity> getAdvice() async {
    // call a repository, to get data (failure or data)
    // process the data with the business logic (manipulate the data)
    // return the data

    await Future.delayed(const Duration(seconds: 2), () {});
    return const AdviceEntity(
        id: 1,
        advice:
            'Advice from server but it\'s fake, just to test the usecases using entity');
  }
}
