import 'package:flutter/material.dart';

part 'score_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  static const int boardSize = 9;
  static const int maxMoves = 100;
  static const int fadeOutThreshold = 6;
  static const List<List<int>> winningLines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  int xWins = 0, oWins = 0, draws = 0, currentMove = 0;
  List<String> board = List.filled(boardSize, '');
  List<int> moveHistory = [];
  String currentPlayer = 'X';
  bool isGameOver = false;
  String winner = '';

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
                isGameOver ? winner : "$currentPlayer's move",
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              actionButtons()
            ],
          ),
        ),
      ),
    );
  }

  Widget gameBoard() => GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: boardSize,
        itemBuilder: (BuildContext context, int index) => _buildGridItem(index),
      );

  Widget _buildGridItem(int index) {
    double opacity = (currentMove >= fadeOutThreshold &&
            moveHistory.isNotEmpty &&
            index == moveHistory.first)
        ? 0.5
        : 1.0;
    return GestureDetector(
      onTap: () => handleTap(index),
      child: Opacity(
        opacity: opacity,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
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
      ),
    );
  }

  void handleTap(int index) {
    if (board[index] != '' || isGameOver) return;
    setState(() {
      board[index] = currentPlayer;
      moveHistory.add(index);
      if (moveHistory.length > fadeOutThreshold) {
        board[moveHistory.removeAt(0)] = '';
      }
      checkGameState();
    });
  }

  void checkGameState() {
    if (_checkWinner()) {
      _updateScore(currentPlayer);
      winner = '$currentPlayer wins!';
      isGameOver = true;
    } else if (currentMove >= maxMoves) {
      draws++;
      winner = 'Draw';
      isGameOver = true;
    }
    currentMove++;
  }

  bool _checkWinner() => winningLines
      .any((line) => line.every((index) => board[index] == currentPlayer));

  void _updateScore(String player) {
    if (player == 'X')
      xWins++;
    else
      oWins++;
  }

  Widget actionButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _actionButton(Icons.refresh, 'Restart', _restartGame),
          _actionButton(Icons.home, 'Home', _goHome),
        ],
      );

  Widget _actionButton(IconData icon, String label, VoidCallback onPressed) =>
      ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          minimumSize: const Size(100, 40),
        ),
      );

  void _restartGame() {
    setState(() {
      board = List.filled(boardSize, '');
      moveHistory.clear();
      currentMove = 0;
      isGameOver = false;
    });
  }

  void _goHome() => Navigator.pop(context);
}
