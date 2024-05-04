part of 'game_page.dart';

class ScoreBoard extends StatelessWidget {
  final int xWins;
  final int oWins;
  final int draws;

  const ScoreBoard({
    super.key,
    required this.xWins,
    required this.oWins,
    required this.draws,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _scoreTile('X', xWins, Colors.blue),
        _scoreTile('O', oWins, Colors.green),
        _scoreTile('Draws', draws, Colors.grey),
      ],
    );
  }

  Widget _scoreTile(String player, int score, Color color) {
    return Column(
      children: <Widget>[
        (player == 'Draws')
            ? const Icon(Icons.cached, size: 40, color: Colors.grey)
            : (player == 'X')
                ? const Icon(Icons.close, size: 40, color: Colors.blue)
                : const Icon(Icons.radio_button_unchecked,
                    size: 40, color: Colors.green),
        Text(player == 'Draws' ? '$score Draws' : '$score Wins',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
