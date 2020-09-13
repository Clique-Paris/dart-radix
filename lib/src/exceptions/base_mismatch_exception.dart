import 'package:dart_base_arithmetic/src/structs/based_number.dart';

class BaseMismatchException implements Exception {
  String _message;

  BaseMismatchException(
      {BasedNumber left, BasedNumber right, String operator}) {
    _message =
        '${left.toString()} and ${right.toString()} has not the same bases. $operator operator is supported only with same bases';
  }

  @override
  String toString() {
    return _message;
  }
}
