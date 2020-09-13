import 'package:dart_base_arithmetic/src/structs/euclidien_division.dart';

extension IntegerEuclidienDivisionExtension on int {
  EuclidienDivision euclidienDivision(int other) {
    if (other == 0) {
      throw IntegerDivisionByZeroException();
    }
    var remainder = this % other;
    var quotient = (this - remainder) ~/ other;
    return EuclidienDivision(d: other, n: this, r: remainder, q: quotient);
  }
}
