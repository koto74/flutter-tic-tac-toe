/*
part of 'game_page.dart';

class GameBoard extends StatelessWidget {
  final List<String> board;

  const GameBoard({
    super.key,
    required this.board,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.square(300),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => /*_buildGridItem(index)*/
            Text(index.toString()),
        itemCount: 9,
      ),
    );
  }
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
*/