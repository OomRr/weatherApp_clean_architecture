import 'package:dio/dio.dart';

import '../../core/constants/consts.dart';
import '../model/weather_model.dart';

abstract class BaseRemoteDatasource {
  Future<WeatherModel> getWeatherByName(String countryName);
}

class RemoteDatasource implements BaseRemoteDatasource {
  @override
  Future<WeatherModel> getWeatherByName(String countryName) async {
    try {
      final dio = Dio();

      var response = await dio.get(
          '${Constants.baseUrl}/weather?q=$countryName&appid=${Constants.apiKey}');
      print(response);
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      throw UnimplementedError();
    }
  }
}
