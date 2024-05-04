part of 'game_page.dart';

class ScoreBoard extends StatelessWidget {
  final int xWins;
  final int oWins;
  final int draws;

  static const Map<String, IconData> icons = {
    'X': Icons.close,
    'O': Icons.radio_button_unchecked,
    'Draws': Icons.cached,
  };

  static const Map<String, Color> colors = {
    'X': Colors.blue,
    'O': Colors.green,
    'Draws': Colors.grey,
  };

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
        _scoreTile('X', xWins),
        _scoreTile('O', oWins),
        _scoreTile('Draws', draws),
      ],
    );
  }

  Widget _scoreTile(String player, int score) {
    return Column(
      children: <Widget>[
        Icon(icons[player], size: 40, color: colors[player]),
        Text(
          '$score ${player == 'Draws' ? 'Draws' : 'Wins'}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
