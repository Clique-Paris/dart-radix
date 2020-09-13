import 'package:dart_base_arithmetic/src/structs/euclidien_division.dart';

extension IntegerEuclidienDivisionExtension on int {
  EuclidienDivision euclidienDivision(int other) {
    return EuclidienDivision(
        d: other, n: this, r: this % other, q: this ~/ other);
  }
}
