import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertictactoe/pages/title/title_page.dart'; // 仮にここにTicTacToeAppがあると仮定

void main() {
  group('TitleScreen Tests', () {
    testWidgets('Displays the correct items on TitleScreen',
        (WidgetTester tester) async {
      // アプリをビルドする
      await tester.pumpWidget(const MaterialApp(home: TitleScreen()));

      // 各種テキストウィジェットの存在確認
      expect(find.text('Tic Tac Toe'), findsOneWidget);
      expect(find.text('Choose your play mode'), findsOneWidget);
      expect(find.text('With AI'), findsOneWidget);
      expect(find.text('With a friend'), findsOneWidget);

      // アイコンの存在確認
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byIcon(Icons.radio_button_unchecked), findsOneWidget);

      // ボタンの存在確認
      expect(find.byType(ElevatedButton), findsNWidgets(2));
    });

    testWidgets('Navigates to GameScreen on button tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: TitleScreen()));

      // TODO: AIモードボタンのタップ

      // With a friendボタンをタップ
      await tester.tap(find.text('With a friend'));
      await tester.pumpAndSettle(); // 画面遷移を完了させる

      expect(find.text("X's move"), findsOneWidget);
    });
  });
}
