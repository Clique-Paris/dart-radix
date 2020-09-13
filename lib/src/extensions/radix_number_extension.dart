import 'package:radix/src/structs/radix.dart';

extension RadixNumberExtension on num {
  Radix inBase(int base, {int maxDecimalDigits = 12}) {
    var result = Radix(base: base, maxDecimal: maxDecimalDigits);
    result.parse(this);
    return result;
  }
}
