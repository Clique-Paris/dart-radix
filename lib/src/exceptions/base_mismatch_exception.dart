import 'package:radix/src/structs/radix.dart';

class BaseMismatchException implements Exception {
  String _message;

  BaseMismatchException({Radix left, Radix right, String operator}) {
    _message =
        '${left.toString()} and ${right.toString()} has not the same bases. $operator operator is supported only with same bases';
  }

  @override
  String toString() {
    return _message;
  }
}
