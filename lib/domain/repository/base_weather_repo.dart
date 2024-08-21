import 'dart:async';

import 'package:weather_clean_architecture/domain/entities/weather.dart';

abstract class BaseWeatherRepo {
  Future<Weather> getWeatherByName(String cityName);
}
