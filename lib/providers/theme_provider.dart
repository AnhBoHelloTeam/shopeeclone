import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const themeStatus = "THEME_STATUS";
  bool _darkTheme = false;  //lưu trạng thái của chủ đề, mặc định là false (chế độ sáng).
  bool get getIsDarkTheme => _darkTheme;


//Khi 1 đtượng của ThemeProvider đc tạo, pthức getTheme() sẽ được gọi để lấy thông tin đã lưu từ SharedPreferences.
  ThemeProvider() {
    getTheme();
  }
  //setDarkTheme() nhận tham số themeValue (giá trị true hoặc false chỉ định chế độ tối hay sáng).
  Future<void> setDarkTheme({required bool themeValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, themeValue);
    _darkTheme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _darkTheme = prefs.getBool(themeStatus) ?? false;
    notifyListeners();
    return _darkTheme;
  }
}
