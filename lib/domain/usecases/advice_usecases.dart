import 'dart:math';

import 'package:advicer/data/repositories/advice_repo_implementation.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecases {
  // usecases is just a collection of method
  final adviceRepo = AdviceRepoImplementation();

  Future<Either<Failure, AdviceEntity>> getAdvice(int adviceId) async {
    return adviceRepo.getAdviceFromDataSource(adviceId);

    // space for business logic after getting the data

    //!  Notes and mock up data below!
    // await Future.delayed(const Duration(seconds: 2), () {});
    // call a repository, to get data (failure or data)
    // process the data with the business logic (manipulate the data)
    // return the data
    // call to repo when success => return data (AdviceEntity)

    // to return a edvice entity use Right (because advice entity in the right at either)
    // return const right(
    //   AdviceEntity(
    //     id: 1,
    //     advice:
    //         'Advice from server but it\'s fake, just to test the usecases using entity',
    //   ),
    // );
    // to return an error use Left (because failure in the left at Either)
    // return left(ServerFailure());
  }
}
