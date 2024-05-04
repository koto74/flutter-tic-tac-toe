import 'package:flutter/material.dart';
import 'package:fluttertictactoe/pages/game/game_page.dart';

void main() => runApp(const TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tic Tac Toe',
      home: TitleScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  void navigateToGameScreen(BuildContext context, {bool withAI = false}) {
    // AIモードに対応した場合の追加ロジック
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tic Tac Toe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 100),
            iconRow(),
            const SizedBox(height: 30),
            const Text(
              'Choose your play mode',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            playModeButton(context, 'With AI', true),
            const SizedBox(height: 10),
            playModeButton(context, 'With a friend', false),
          ],
        ),
      ),
    );
  }

  Widget iconRow() => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.close, size: 40, color: Colors.blue),
          SizedBox(width: 10),
          Icon(Icons.radio_button_unchecked, size: 40, color: Colors.green),
        ],
      );

  Widget playModeButton(BuildContext context, String text, bool withAI) =>
      ElevatedButton(
        onPressed: () => navigateToGameScreen(context, withAI: withAI),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          minimumSize: const Size(200, 40),
        ),
        child: Text(text),
      );
}
