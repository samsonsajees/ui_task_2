import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ui_task_2/models/weather_model.dart';

class WeatherService {
  static const String _url = 
      "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m";

  Future<WeatherModel?> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        print("API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception fetching weather: $e");
      return null;
    }
  }
}