import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kantinmenu/main.dart';

void main() {
  testWidgets('shows the starting menu list', (WidgetTester tester) async {
    await tester.pumpWidget(const KantinMenuApp());

    expect(find.text('Kedai Matcha'), findsOneWidget);
    expect(find.text('Matcha Cream'), findsOneWidget);
    expect(find.text('Matcha Latte'), findsOneWidget);
    expect(find.text('Matcha Lemon'), findsOneWidget);
  });

  testWidgets('detail page shows menu name and price without overflow', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(360, 560));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const KantinMenuApp());
    await tester.tap(find.text('Matcha Latte'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Menu'), findsOneWidget);
    expect(find.text('Matcha Latte'), findsOneWidget);
    expect(find.text('Rp 18000'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('valid menu is returned to and shown in the list', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const KantinMenuApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'Matcha Oat');
    await tester.enterText(find.byType(TextFormField).at(1), '24000');
    await tester.tap(find.text('Simpan Menu'));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(ListView), const Offset(0, -600));
    await tester.pumpAndSettle();

    expect(find.text('Matcha Oat'), findsOneWidget);
    expect(find.text('Rp 24000'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('add menu form rejects empty values', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const KantinMenuApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Simpan Menu'));
    await tester.pumpAndSettle();

    expect(find.text('Nama menu tidak boleh kosong'), findsOneWidget);
    expect(find.text('Harga tidak boleh kosong'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
