import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherModel with ChangeNotifier {
  String _count = "明日天气";
  String get count => _count;

  void requestWeatherInfo() {
    notifyListeners();
  }
}