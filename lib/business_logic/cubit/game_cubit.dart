import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());

  double xPosition = 100, yPosition = 100;
  int score = 0, timeLeft = 10;
  bool finish = false;
  int moveInterval = 1000;
  Color color = Colors.amber;

  Timer? gameTimer, moveTimer;

  void startGame(BuildContext context) {
    score = 0;
    timeLeft = 10;
    finish = false;
    moveInterval = 1000;
    gameTimer?.cancel();
    moveTimer?.cancel();

    emit(GameRefresh());

    gameTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (timeLeft > 0) {
        timeLeft--;
        emit(GameRefresh());
      } else {
        finish = true;
        gameTimer?.cancel();
        moveTimer?.cancel();

        emit(GameOver(score));
      }
    });

    changeSpeed();
  }

  void changeSpeed() {
    moveTimer?.cancel();
    moveTimer = Timer.periodic(Duration(milliseconds: moveInterval), (_) {
      if (!finish) {
        moving();
        emit(GameRefresh());
      }
    });
  }

  void moving() {
    xPosition = Random().nextDouble() * 300;
    yPosition = Random().nextDouble() * 500;
  }

  void onClick() {
    moveInterval = moveInterval - 10;
    changeSpeed();
    moving();
    if (!finish) {
      score++;
      color = color == Colors.amber ? Colors.blue : Colors.amber;
      changeSpeed();

      emit(GameRefresh());
    }
  }

  @override
  Future<void> close() {
    gameTimer?.cancel();
    moveTimer?.cancel();
    return super.close();
  }
}
