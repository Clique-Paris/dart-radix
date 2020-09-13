/// Exception indicates that the given base is lesser than 2 or greater than 10
class BaseNotSupportedException implements Exception {
  String _message;

  BaseNotSupportedException(int base) {
    _message =
        '$base is not supported. Only bases between [2,10] are supported';
  }

  @override
  String toString() {
    return _message;
  }
}
