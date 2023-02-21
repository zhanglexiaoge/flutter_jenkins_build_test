import 'package:flutter/cupertino.dart';

///全局数据监听 相当于iOS 观察者模式
class TestChangeNotifier extends ChangeNotifier {
  static TestChangeNotifier? _notifier;

  static TestChangeNotifier shared() {
    _notifier ??= TestChangeNotifier();
    return _notifier!;
  }

  void change() {
    notifyListeners();
  }
}
