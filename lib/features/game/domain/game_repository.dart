import 'package:guess_it_frontend/core/failure/failure.dart';
import 'package:guess_it_frontend/core/model/either.dart';

abstract class GameRepository {
  Future<Either<Failure, String>> getRandomWord(int length);
  Future<Either<Failure, String>> checkWord(String word);
}
