import 'package:dart_base_arithmetic/src/structs/base_number.dart';

extension BaseArithmeticNumberExtension on num {
  BaseNumber inBase(int base, {int maxDecimalDigits}) {
    var result = BaseNumber(base: 3, maxDecimal: maxDecimalDigits);
    result.parse(this);
    return result;
  }
}
