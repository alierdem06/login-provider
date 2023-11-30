import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isCheckBoxokay = false;
  String? _inputText;
  bool isLoading = false;
  void chackBoxChange(bool value) {
    isCheckBoxokay = value;
    notifyListeners();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<bool> controlTextValue() async {
    changeLoading();
    await Future.delayed(const Duration(seconds: 1));
    changeLoading();
    return _inputText != null;
  }
}
