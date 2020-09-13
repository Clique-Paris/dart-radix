import 'dart:math';

import 'package:test/test.dart';
import 'package:radix/src/extensions/decimal_part_extension.dart';

void main() {
  group('Testing decimal part num extension', () {
    test('with a positif decimal number', () {
      expect(0.234 - 1.234.decimalPart, lessThan(pow(10, -12)));
    });

    test('with a a positif decimal value on an integer', () {
      expect(4.decimalPart, 0);
    });

    test('with a negatif decimal value', () {
      expect(-0.234 - -2.234.decimalPart, lessThan(pow(10, -12)));
    });

    test('with a negatif integer', () {
      expect(-234.decimalPart, 0);
    });
  });
}
