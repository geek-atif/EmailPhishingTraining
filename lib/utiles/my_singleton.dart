import 'dart:collection';

class MySingleton {
  static final MySingleton _singleton = MySingleton._internal();

  double baalance = 0.0;
  factory MySingleton() {
    return _singleton;
  }
  MySingleton._internal();
  static MySingleton get shared => _singleton;
}
