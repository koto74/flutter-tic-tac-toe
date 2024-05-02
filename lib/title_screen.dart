import 'package:flutter/material.dart';
import 'game_screen.dart';

void main() => runApp(const TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tic Tac Toe',
      home: TitleScreen(),
    );
  }
}

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Start Game'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GameScreen()));
          },
        ),
      ),
    );
  }
}
