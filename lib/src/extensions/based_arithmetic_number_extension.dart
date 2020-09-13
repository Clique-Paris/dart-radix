import 'package:dart_base_arithmetic/src/structs/based_number.dart';

extension BasedArithmeticNumberExtension on num {
  BasedNumber inBase(int base, {int maxDecimalDigits}) {
    var result = BasedNumber(base: 3, maxDecimal: maxDecimalDigits);
    result.parse(this);
    return result;
  }
}
