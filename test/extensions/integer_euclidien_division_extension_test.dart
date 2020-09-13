import 'package:test/test.dart';
import 'package:radix/src/extensions/integer_euclidien_division_extension.dart';

void main() {
  group('Testing the integer euclidien division extension', () {
    test('with a basic division', () {
      var result = 5.euclidienDivision(2);
      expect(result.d, 2);
      expect(result.n, 5);
      expect(result.r, 1);
      expect(result.q, 2);
    });

    test('with a negatif number', () {
      var result = (-5).euclidienDivision(2);
      expect(result.d, 2);
      expect(result.n, -5);
      expect(result.q, -3);
      expect(result.r, 1);
    });

    test('by 0', () {
      expect(() => 2.euclidienDivision(0),
          throwsA(TypeMatcher<IntegerDivisionByZeroException>()));
    });

    test('0 by 0', () {
      expect(() => 0.euclidienDivision(0),
          throwsA(TypeMatcher<IntegerDivisionByZeroException>()));
    });
  });
}
