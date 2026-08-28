import 'package:auto_explorer/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('muestra la pantalla inicial de Auto Explorer', (tester) async {
    await tester.pumpWidget(const AutoExplorerApp());

    expect(find.text('Auto Explorer'), findsOneWidget);
    expect(find.text('Bienvenido a Auto Explorer'), findsOneWidget);
    expect(find.text('Ver auto destacado'), findsOneWidget);
  });
}