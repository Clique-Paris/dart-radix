import 'package:dart_base_arithmetic/src/structs/base_number.dart';

class BaseMismatchException implements Exception {
  String _message;

  BaseMismatchException({BaseNumber left, BaseNumber right, String operator}) {
    _message =
        '${left.toString()} and ${right.toString()} has not the same bases. $operator operator is supported only with same bases';
  }

  @override
  String toString() {
    return _message;
  }
}
