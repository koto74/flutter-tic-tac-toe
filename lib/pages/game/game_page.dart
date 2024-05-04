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
  int currentMove = 0;
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';

  void handleTap(int index) {
    if (board[index] != '') return;

    setState(() {
      board[index] = currentPlayer;
      currentMove++;
      if (_checkWinner(currentPlayer, board)) {
        _updateScore(currentPlayer);
        _restartGame();
      } else if (currentMove >= 9) {
        draws++;
        _restartGame();
      }
    });
  }

  Widget gameBoard() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return _buildGridItem(index);
      },
    );
  }

  Widget _buildGridItem(int index) {
    return GestureDetector(
      onTap: () => handleTap(index),
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
      currentMove = 0;
    });
  }

  void _goHome() {
    Navigator.pop(context);
  }

  bool _checkWinner(String player, List<String> board) {
    const lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6] // Diagonals
    ];
    return lines.any((line) =>
        board[line[0]] == player &&
        board[line[1]] == player &&
        board[line[2]] == player);
  }

  void _updateScore(String player) {
    if (player == 'X') {
      xWins++;
    } else if (player == 'O') {
      oWins++;
    }
  }

  @override
  Widget build(BuildContext context) {
    currentPlayer = currentMove % 2 == 0 ? 'X' : 'O';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ScoreBoard(xWins: xWins, oWins: oWins, draws: draws),
              SizedBox.fromSize(
                  size: const Size.square(300), child: gameBoard()),
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
}
