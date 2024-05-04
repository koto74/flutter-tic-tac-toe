import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertictactoe/pages/game/game_page.dart';

void main() {
  group('GameScreen Tests', () {
    testWidgets('Initial state is correct', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: GameScreen()));

      // 初期スコアが0であることを確認
      expect(find.text('0 Wins'), findsNWidgets(2)); // XとOの両方
      expect(find.text('0 Draws'), findsOneWidget);

      // 各アイコンが1つずつ存在することを確認
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byIcon(Icons.radio_button_unchecked), findsOneWidget);
      expect(find.byIcon(Icons.cached), findsOneWidget);

      // ボードが存在することを確認
      for (int i = 0; i < 9; i++) {
        expect(find.byKey(ValueKey('board_tile_$i')), findsOneWidget);
      }

      // Xが最初に配置されることを確認
      expect(find.text("X's move"), findsOneWidget);

      // リセットボタンが存在することを確認
      expect(find.text('Restart'), findsOneWidget);

      // ホームボタンが存在することを確認
      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('Game play interactions', (WidgetTester tester) async {
      /*
      await tester.pumpWidget(const MaterialApp(home: GameScreen()));

      // ボードの0番目をタップしてXを配置
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump();

      // Xが配置されたことを確認
      expect(find.byIcon(Icons.close), findsOneWidget);

      // 他のセルにOが配置されるか確認
      await tester.tap(find.byType(GestureDetector).at(1));
      await tester.pump();

      // Oが配置されたことを確認
      expect(find.byIcon(Icons.radio_button_unchecked), findsOneWidget);

      // すでにマークされたセルをタップしても何も変わらないことを確認
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump();

      // XとOが1つずつで変化なしを確認
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byIcon(Icons.radio_button_unchecked), findsOneWidget);
      */
    });

    testWidgets('Game reset and home navigation', (WidgetTester tester) async {
      /*
      await tester.pumpWidget(const MaterialApp(home: GameScreen()));

      // リセットボタンをタップ
      await tester.tap(find.text('Restart'));
      await tester.pump();

      // ボードがリセットされているか確認
      expect(find.byIcon(Icons.close), findsNothing);
      expect(find.byIcon(Icons.radio_button_unchecked), findsNothing);

      // TODO: ホームボタンをタップして戻る動作の確認
      */
    });
  });
}
