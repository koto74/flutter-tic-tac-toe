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
      ],
    );
  }

  Widget _scoreTile(String player, int score, Color color) {
    return Column(
      children: <Widget>[
        Text(player, style: TextStyle(fontSize: 18, color: color)),
        Text('$score Wins',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
