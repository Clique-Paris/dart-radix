# Radix

A Dart package that handles [base arithmetics](https://en.wikipedia.org/wiki/Radix) operations.

## Installing

1. Depend on it

Add the package in your `pubspec.yaml` file

```dart
dependencies:
  radix: ^0.1.0
```

2. Install it
You can install package from the command line

- with pub:
  ```bash
  pub get
  ```

- with flutter:
  ```bash
  flutter pub get
  ```
Alternatively, your editor might support `pub get` or `flutter pub get`. Check the docs for your editor to learn more.

3. Import it

Now in Dart code you can use:
```dart
import 'package:radix/radix.dart';
```

## A simple usage example

```dart
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
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/Clique-Paris/dart-radix/issues