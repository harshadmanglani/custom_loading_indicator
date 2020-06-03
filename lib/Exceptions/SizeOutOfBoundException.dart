class SizeOutOfBoundException implements Exception {
  String _message;

  SizeOutOfBoundException([String message = "Size is out of Bounds"]) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
