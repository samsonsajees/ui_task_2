import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ui_task_2/models/weather_model.dart';
import 'dart:io';

class WeatherService {
  static const String _url = 
      "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m";

  Future<WeatherModel?> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(_url));
 
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        
        final data = jsonDecode(response.body);
        
        if (data == null || (data is Map && data.isEmpty)) {
          throw Exception("No weather data returned from server");
        }

        try {
          return WeatherModel.fromJson(data);
        } catch (e) {
          throw Exception("Failed to parse weather data");
        }

      } 
      else if (response.statusCode == 404) {
        throw Exception("Location not found. Please check the coordinates");
      } 
      else if (response.statusCode >= 500) {
        throw Exception("Internal server error. Please try again later");
      } 
      else if (response.statusCode == 400) {
        throw Exception("Invalid request");
      }
      else {
        throw Exception("Error: ${response.statusCode}");
      }
    } 
    on SocketException {
      throw Exception("No Internet Connection");
    } 
    catch (e) {
      throw Exception(e.toString().replaceAll('Exception: ', ''));
    }
  }
}