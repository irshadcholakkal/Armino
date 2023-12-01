import 'dart:convert';

import 'package:arnimo_test/Data/model_class_current_data.dart';
import 'package:arnimo_test/Data/model_class_forecast_data.dart';
import 'package:http/http.dart' as http;


class WeatherRepository {
  final String apiKey;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
   final String forecastebaseUrl ='https://api.openweathermap.org/data/2.5/forecast';

  WeatherRepository(this.apiKey);

  Future<Datas> getWeather(double latitude, double longitude) async {
    final response = await http.get(Uri.parse('$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      print(response.body);
      return Datas.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

   Future<ForecastDatas> getForecastWeather(double latitude, double longitude) async {
    final response = await http.get(Uri.parse('$forecastebaseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      print(response.body);
      return ForecastDatas.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  








}