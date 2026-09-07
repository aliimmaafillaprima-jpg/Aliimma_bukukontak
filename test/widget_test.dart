import 'package:flutter_test/flutter_test.dart';
import 'package:buku_kontak/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const BukuKontakApp());

    expect(find.text('Buku Kontak'), findsOneWidget);
  });
}