import 'package:weather_clean_architecture/domain/entities/weather.dart';
import 'package:weather_clean_architecture/domain/repository/base_weather_repo.dart';

class GetWeatherByCountyName {
  final BaseWeatherRepo repo;

  GetWeatherByCountyName(this.repo);

  Future<Weather> execute(String name) async {
    return await repo.getWeatherByName(name);
  }
}
