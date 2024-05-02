import 'package:flutter/material.dart';
import 'game_screen.dart';

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      home: TitleScreen(),
    );
  }
}

class TitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Start Game'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GameScreen()));
          },
        ),
      ),
    );
  }
}
