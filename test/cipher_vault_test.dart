import 'package:cipher_vault/cipher_vault.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CipherVault widget tests', () {
    testWidgets('Widget displays random animation', (final tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CipherVault(),
        ),
      );

      await tester.pump();

      expect(find.text(''), findsNothing);
    });

    testWidgets('Widget displays secret', (final tester) async {
      const secret = 'My Secret';
      await tester.pumpWidget(
        const MaterialApp(
          home: CipherVault(secret: secret),
        ),
      );

      await tester.pump(const Duration(seconds: 4));

      expect(
        find.text(secret),
        findsOneWidget,
      );
    });

    testWidgets('Widget timer test', (final tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CipherVault(),
        ),
      );

      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CipherVault), findsOneWidget);
    });
  });
}
