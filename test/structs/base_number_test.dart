import 'package:radix/radix.dart';
import 'package:test/test.dart';

void main() {
  group('Base number tests', () {
    Radix bn1;
    Radix bn2;
    Radix bn3;
    setUpAll(() {
      bn1 = Radix(base: 4);
      bn2 = Radix(base: 4);
      bn3 = Radix(base: 5);
    });

    test('Parse 36', () {
      bn1.parse(36);
      expect(bn1.content, 210);
      expect(bn1.base, 4);
    });

    test('Parse 36.4', () {
      bn1.parse(36.4);
      expect(bn1.content, 210.121212121212);
      expect(bn1.base, 4);
    });

    test('Decimal value of 210 in base 4', () {
      bn1.content = 210;
      expect(bn1.decimal, 36);
      expect(bn1.base, 4);
    });

    test('Decimal value of 210.1 in base 4', () {
      bn1.content = 210.1;
      expect(bn1.decimal, 36.25);
      expect(bn1.base, 4);
    });

    test('Sum of 210.1 in base 4 and 210 in base 4', () {
      bn1.content = 210.1;
      bn2.content = 210;
      var sum = (bn1 + bn2);
      expect(sum.content, 1020.1);
      expect(sum.base, 4);
    });

    test('Sum of 210 in base 4 and 210 in base 5', () {
      bn1.content = 210;
      bn3.content = 210;
      try {
        bn1 + bn3;
      } on BaseMismatchException catch (_) {
        expect(true, true);
      }
    });

    test('Difference betweeen 210.1 in base 4 and 210 in base 4', () {
      bn1.content = 210.1;
      bn2.content = 210;
      var diff = (bn1 - bn2);
      expect(diff.content, 0.1);
      expect(diff.base, 4);
    });
    test('Difference between 210 in base 4 and 210 in base 5', () {
      bn1.content = 210;
      bn3.content = 210;
      try {
        bn1 - bn3;
      } on BaseMismatchException catch (_) {
        expect(true, true);
      }
    });

    test('Multiplication of 210.1 in base 4 by 210 in base 4', () {
      bn1.content = 210.1;
      bn2.content = 210;
      var mult = (bn1 * bn2);
      expect(mult.content, 110121);
      expect(mult.base, 4);
    });

    test('Multiplication of 210 in base 4 by 210 in base 5', () {
      bn1.content = 210;
      bn3.content = 210;
      try {
        bn1 * bn3;
      } on BaseMismatchException catch (_) {
        expect(true, true);
      }
    });

    test('Division of 210.1 in base 4 and 0.1 in base 4', () {
      bn1.content = 210.1;
      bn2.content = 0.1;
      var div = (bn1 / bn2);
      expect(div.content, 2101);
      expect(div.base, 4);
    });

    test('Division of 210 in base 4 by 210 in base 5', () {
      bn1.content = 210;
      bn3.content = 210;
      try {
        bn1 / bn3;
      } on BaseMismatchException catch (_) {
        expect(true, true);
      }
    });

    test('String representation of 210.1 in base 4', () {
      bn1.content = 210.1;
      expect(bn1.toString(), '(210.1)₄');
    });
  });
}
