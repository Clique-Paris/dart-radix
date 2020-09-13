import 'package:dart_base_arithmetic/src/structs/base_number.dart';

extension BaseArithmeticNumberExtension on num {
  BaseNumber inBase(int base, {int maxDecimalDigits = 12}) {
    var result = BaseNumber(base: base, maxDecimal: maxDecimalDigits);
    result.parse(this);
    return result;
  }
}
