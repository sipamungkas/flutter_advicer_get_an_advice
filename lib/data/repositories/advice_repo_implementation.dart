// Repository in data layer is the implementation repo from domain layer

import 'package:advicer/data/datasources/advice_remote_datasource.dart';
import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImplementation implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource =
      AdviceRemoteDatasourceImplementation();

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource(
      adviceId) async {
    try {
      final result =
          await adviceRemoteDatasource.getRandomAdviceFromApi(adviceId);
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on CacheException catch (_) {
      return left(CacheFailure());
    } catch (e) {
      // handle left exception
      return left(GeneralFailure());
    }
  }
}
