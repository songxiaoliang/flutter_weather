
import '../utils/http_util.dart';
import '../common/api.dart';

class WeatherService {

  Future getWeatherInfo(params) async {
    // 请求网络
    return HttpUtil.get(Api.NOW_WEATHER_URL, params);
  }
}