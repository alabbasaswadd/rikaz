import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz/business_logic/cubit/game_cubit.dart';
import 'package:rikaz/business_logic/cubit/game_state.dart';
import 'package:rikaz/core/widgets/my_alert_dialog.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GameCubit>().startGame(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {
        if (state is GameOver) {
          showDialog(
            context: context,
            builder: (_) => MyAlertDialog(
              title: "Score Is ${state.finalScore}",
              content: "Do You Want to Restart?",
              onOk: () {
                Navigator.pop(context);
                context.read<GameCubit>().startGame(context);
              },
            ),
          ).then((e) {
            context.read<GameCubit>().startGame(context);
          });
        }
      },
      builder: (context, state) {
        final cubit = context.read<GameCubit>();
        return Scaffold(
          body: Center(
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 400),
                  left: cubit.xPosition,
                  top: cubit.yPosition,
                  child: GestureDetector(
                    onTap: () {
                      cubit.onClick();
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: cubit.color,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Text(
                    'Time: ${cubit.timeLeft}',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
