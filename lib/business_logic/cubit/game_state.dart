abstract class GameState {}

class GameInitial extends GameState {}

class GameRefresh extends GameState {}

class GameOver extends GameState {
  final int finalScore;
  GameOver(this.finalScore);
}
