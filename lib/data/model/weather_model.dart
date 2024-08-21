import 'package:weather_clean_architecture/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(super.main, super.description, super.temp, super.cityName);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      json['weather'][0]['main'],
      json['weather'][0]['description'],
      json['main']['temp'],
      json['name']);
}
