import 'dart:math';
import 'package:radix/src/exceptions/base_mismatch_exception.dart';
import 'package:radix/src/extensions/integer_euclidien_division_extension.dart';
import 'package:radix/src/extensions/decimal_part_extension.dart';
import 'package:radix/src/exceptions/base_not_supported_exception.dart';
import 'package:radix/src/structs/euclidien_division.dart';

class Radix {
  final int base;
  int maxDecimal;
  num content;

  /// Constucts a BaseNumber with given base, content and maxDecimal values
  ///
  /// If base is not valid i.e. not in less then 2 or greater than 10, throws [BAseNotSupportedException]
  Radix({this.base, this.content, this.maxDecimal = 12}) {
    if (base == null) {
      throw FormatException(
          'Base should be defined and should have a value between [2,10]');
    }
    if (base < 2 || base >= 11) {
      throw BaseNotSupportedException(base);
    }
  }

  /// Sums two based numbers on the same base.
  ///
  /// Throws [BaseMismatchException] if both bases are not equals
  Radix operator +(Radix other) {
    if (base != other.base) {
      throw BaseMismatchException(left: this, right: other, operator: '+');
    }
    var result = Radix(base: base, maxDecimal: maxDecimal);
    result.parse(decimal + other.decimal);
    return result;
  }

  /// Substracts two based numbers on the same base.
  ///
  /// Throws [BaseMismatchException] if both bases are not equals
  Radix operator -(Radix other) {
    if (base != other.base) {
      throw BaseMismatchException(left: this, right: other, operator: '-');
    }
    var result = Radix(base: base, maxDecimal: maxDecimal);
    result.parse(decimal - other.decimal);
    return result;
  }

  /// Multiplys two based numbers on the same base.
  ///
  /// Throws [BaseMismatchException] if both bases are not equals
  Radix operator *(Radix other) {
    if (base != other.base) {
      throw BaseMismatchException(left: this, right: other, operator: '*');
    }
    var result = Radix(base: base, maxDecimal: maxDecimal);
    result.parse(decimal * other.decimal);
    return result;
  }

  /// Divides two based numbers on the same base.
  ///
  /// Throws [BaseMismatchException] if both bases are not equals
  Radix operator /(Radix other) {
    if (base != other.base) {
      throw BaseMismatchException(left: this, right: other, operator: '/');
    }
    var result = Radix(base: base, maxDecimal: maxDecimal);
    result.parse(decimal / other.decimal);
    return result;
  }

  /// Returns the decimal value corresponding the given based number
  ///
  /// Throws [FormatException] if the [content] is null.
  num get decimal {
    if (content == null) {
      throw FormatException('BasedNumber should have a valid content');
    }
    var isNegatif = content.sign == -1;
    var _integerPart = content.abs().toInt();
    var _integerPartString = _integerPart.toString().split('');

    var result = 0.0;
    for (var i = _integerPartString.length - 1; i >= 0; i--) {
      result += int.parse(_integerPartString[i]) *
          pow(base, _integerPartString.length - 1 - i);
    }
    if (content.abs() - _integerPart != 0) {
      var _decimalPartString = content.abs().toString().split('.')[1];
      for (var i = 0; i < _decimalPartString.length; i++) {
        result += (int.parse(_decimalPartString[i]) * pow(base, -1 * (i + 1)));
      }
    }
    if (isNegatif) {
      result = result * -1;
    }
    return result;
  }

  ///Checks if equals
  ///
  ///If two based numbers are equals their decimal values are equals too
  bool equals(Radix other) {
    return decimal == other.decimal;
  }

  /// Parses a number and sets the content with given maximum decimal number
  void parse(num number) {
    var isNegatif = number.sign == -1;
    number = number.abs();
    var _integerPart = number.toInt();
    var _resultString = '';
    EuclidienDivision _divisionResult;
    do {
      _divisionResult = _integerPart.euclidienDivision(base);
      _resultString = _divisionResult.r.toString() + _resultString;
      _integerPart = _divisionResult.q;
    } while (_integerPart != 0);
    if (number.decimalPart != 0) {
      var counter = 0;
      var _decimalPart = number.decimalPart;
      _resultString += '.';
      do {
        _decimalPart = (_decimalPart * base);
        _resultString += _decimalPart.toInt().toString();
        _decimalPart = _decimalPart.decimalPart;
        counter++;
      } while (_decimalPart != 0 && counter < maxDecimal);
    }
    content = (isNegatif ? -1 : 1) * num.parse(_resultString);
  }

  @override

  /// Returns the [String] representation of the [Radix]
  ///
  /// Throws [BaseNotSupportedException] if the base is not supported
  String toString() {
    String baseString;
    switch (base) {
      case 2:
        baseString = '₂';
        break;
      case 3:
        baseString = '₃';
        break;
      case 4:
        baseString = '₄';
        break;
      case 5:
        baseString = '₅';
        break;
      case 6:
        baseString = '₆';
        break;
      case 7:
        baseString = '₇';
        break;
      case 8:
        baseString = '₈';
        break;
      case 9:
        baseString = '₉';
        break;
      case 10:
        baseString = '₁₀';
        break;
      default:
        throw BaseNotSupportedException(base);
    }
    return '($content)$baseString';
  }
}
