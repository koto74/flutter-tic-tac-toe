import 'package:flutter/material.dart';

part 'score_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  int xWins = 0;
  int oWins = 0;
  int draws = 0;
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ScoreBoard(xWins: xWins, oWins: oWins, draws: draws),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildGridItem(index);
                  },
                ),
              ),
              Text(
                "$currentPlayer's move",
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _actionButton(Icons.refresh, 'Restart', _restartGame),
                  _actionButton(Icons.home, 'Home', _goHome),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    return GestureDetector(
      onTap: () => _handleTap(index),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: Center(
          child: Icon(
            board[index] == 'X'
                ? Icons.close
                : board[index] == 'O'
                    ? Icons.radio_button_unchecked
                    : null,
            size: 40,
            color: board[index] == 'X' ? Colors.blue : Colors.green,
          ),
        ),
      ),
    );
  }

  void _handleTap(int index) {
    if (board[index] == '') {
      setState(() {
        board[index] = currentPlayer;
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });
    }
  }

  Widget _actionButton(IconData icon, String label, VoidCallback onPressed) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        minimumSize: const Size(100, 40),
      ),
    );
  }

  void _restartGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
    });
  }

  void _goHome() {
    Navigator.pop(context); // ホーム画面に戻る
  }
}
