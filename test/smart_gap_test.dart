import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_gap/smart_gap.dart';

void main() {
  group('Gap Widget Tests', () {
    testWidgets('Gap creates horizontal space in Row', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Row(
            children: [
              Text('A'),
              Gap(16),
              Text('B'),
            ],
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, 16);
      expect(sizedBox.height, null);
    });

    testWidgets('Gap creates vertical space in Column', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Column(
            children: [
              Text('A'),
              Gap(16),
              Text('B'),
            ],
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, 16);
      expect(sizedBox.width, null);
    });

    test('Predefined gaps have correct sizes', () {
      expect(Gaps.xs.size, 4.0);
      expect(Gaps.sm.size, 8.0);
      expect(Gaps.md.size, 16.0);
      expect(Gaps.lg.size, 24.0);
      expect(Gaps.xl.size, 32.0);
      expect(Gaps.xxl.size, 48.0);
    });

    test('Extension creates Gap correctly', () {
      final gap = 16.gap;
      expect(gap.size, 16.0);
    });
  });
}
