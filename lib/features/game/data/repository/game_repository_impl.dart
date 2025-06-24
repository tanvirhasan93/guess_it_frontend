import 'package:dio/dio.dart';
import 'package:guess_it_frontend/core/failure/failure.dart';
import 'package:guess_it_frontend/core/model/either.dart';
import 'package:guess_it_frontend/features/game/data/datasource/game_remote_datasource.dart';
import 'package:guess_it_frontend/features/game/domain/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final GameRemoteDatasource gameRemoteDatasource;
  GameRepositoryImpl({required this.gameRemoteDatasource});

  @override
  Future<Either<Failure, String>> checkWord(String word) async {
    try {
      var result = await gameRemoteDatasource.checkWord(word);
      return Right('');
    } on DioException catch (e) {
      return Left(GameFailure(message: 'Please, enter correct word'));
    } catch (e) {
      return Left(GameFailure(message: 'Please, enter correct word'));
    }
  }

  @override
  Future<Either<Failure, String>> getRandomWord(int length) async {
    try {
      var result = await gameRemoteDatasource.getRandomWord(length);
      try {
        await gameRemoteDatasource.checkWord(result);
      } catch (e) {
        return getRandomWord(length);
      }
      return Right(result);
    } catch (e) {
      return Left(GameFailure(message: 'Error'));
    }
  }
}
