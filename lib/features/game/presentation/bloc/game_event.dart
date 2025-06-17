abstract class GameEvent {}

class StartGameEvent extends GameEvent {
  final int attemptsCount;
  final int wordLength;

  StartGameEvent(this.attemptsCount, this.wordLength);
}

class EnterAttemptEvent extends GameEvent {}

class EnterKeyEvent extends GameEvent {
  final String key;

  EnterKeyEvent({required this.key});
}

class DeleteKeyEvent extends GameEvent {}
