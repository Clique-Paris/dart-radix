import 'package:test/test.dart';
import 'package:dart_base_arithmetic/src/extensions/base_arithmetic_number_extension.dart';

void main() {
  group('Number toBase function test', () {
    test('13 in base 5', () {
      var bn = 13.inBase(5);
      expect(bn.content, 23);
      expect(bn.base, 5);
    });

    test('13.5 in base 5', () {
      var bn = 13.5.inBase(5);
      expect(bn.content, 23.222222222222);
      expect(bn.base, 5);
    });

    test('-13 in base 5', () {
      var bn = (-13).inBase(5);
      expect(bn.content, -23);
      expect(bn.base, 5);
    });

    test('-13.5 in base 5', () {
      var bn = (-13.5).inBase(5);
      expect(bn.content, -23.222222222222);
      expect(bn.base, 5);
    });
  });
}
