import 'package:flutter/material.dart';
import 'package:weather_clean_architecture/core/utities/styles.dart';

import '../data/datasource/remote_datasource.dart';
import '../data/repository/weather_repo.dart';
import '../domain/entities/weather.dart';
import '../domain/repository/base_weather_repo.dart';
import '../domain/usecase/get_weather_by_name.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Weather weather = Weather('main', 'description', 0, 'cityName');

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: textEditingController,
              onFieldSubmitted: (value) async {
                BaseRemoteDatasource baseRemoteDatasource = RemoteDatasource();
                final BaseWeatherRepo baseWeatherRepo =
                    WeatherRepo(baseRemoteDatasource);
                weather = await GetWeatherByCountyName(baseWeatherRepo)
                    .execute(value);
                setState(() {});
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            customTextShow(weather: weather),
          ],
        ),
      ),
    );
  }
}

class customTextShow extends StatelessWidget {
  customTextShow({
    super.key,
    required this.weather,
  });

  Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Country : ${weather.cityName}', style: Styles.style20),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Temperature : ',
                style: Styles.style20,
              ),
              Text(weather.temp.toString(), style: Styles.style20),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Description : ${weather.description}',
              style: Styles.style20),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Status : ${weather.main}', style: Styles.style20),
        ),
      ],
    );
  }
}
