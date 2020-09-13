import 'package:radix/radix.dart';

void main(List<String> arguments) {
  /// Create a base 5
  var a = Radix(base: 5);

  /// Initialize the content
  a.content = 2114;
  print(a.toString());

  /// Parse 2110 in base 5
  var b = 2210.inBase(5);
  print(b.toString());

  /// Calculate the sum
  print('${a.toString()} + ${b.toString()} = ${(a + b).toString()}');

  /// Calculate the difference
  print('${a.toString()} - ${b.toString()} = ${(a - b).toString()}');

  /// Calculate the multiplication
  print('${a.toString()} * ${b.toString()} = ${(a * b).toString()}');

  /// Calculate the division
  print('${a.toString()} / ${b.toString()} = ${(a / b).toString()}');
}
