import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../services/WeatherService.dart';
import './pood/WeatherInfoModel.dart';

class WeatherModel with ChangeNotifier {

  String _count = "明日天气";
  String get count => _count;
  WeatherDetailModel _weatherDetailModel;
  WeatherDetailModel get weatherDetailModel => _weatherDetailModel;

  WeatherService _service = WeatherService();

  /// 请求当前城市天气
  void requestWeatherInfo() {
    _service.getWeatherInfo(null).then((onValue) {
      if(onValue.statusCode == 200) {
        WeatherDetailModel weatherDetail = WeatherDetailModel.fromJson(onValue.data['HeWeather6'][0]);
        _weatherDetailModel = weatherDetail;
        notifyListeners();
      }
    }).catchError((onError) {
      // 请求失败
      print(onError);
    });
  }

  /// 添加城市
  void addCity() {

  }
}