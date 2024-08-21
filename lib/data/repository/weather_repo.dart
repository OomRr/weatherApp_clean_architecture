import 'package:weather_clean_architecture/data/datasource/remote_datasource.dart';
import 'package:weather_clean_architecture/domain/entities/weather.dart';
import 'package:weather_clean_architecture/domain/repository/base_weather_repo.dart';

class WeatherRepo implements BaseWeatherRepo {
  WeatherRepo(this.baseRemoteDatasource);

  BaseRemoteDatasource baseRemoteDatasource;

  @override
  Future<Weather> getWeatherByName(String countryName) async {
    return await baseRemoteDatasource.getWeatherByName(countryName);
  }
}
