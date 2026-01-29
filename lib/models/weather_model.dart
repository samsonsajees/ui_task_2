class WeatherModel {
  final double latitude;
  final double longitude;
  final String currentTime;
  final double currentTemp;
  final String tempUnit;
  final double currentWindSpeed;
  final String windSpeedUnit;
  final int currentHumidity; // Derived from hourly data
  final String humidityUnit;

  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.currentTime,
    required this.currentTemp,
    required this.tempUnit,
    required this.currentWindSpeed,
    required this.windSpeedUnit,
    required this.currentHumidity,
    required this.humidityUnit,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current'];
    final currentUnits = json['current_units'];
    final hourly = json['hourly'];
    final hourlyUnits = json['hourly_units'];

    String currentTimeStr = current['time'];

    List<dynamic> hourlyTimes = hourly['time'];
    int index = hourlyTimes.indexOf(currentTimeStr);
    if (index == -1) index = 0;
    
    return WeatherModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      currentTime: current['time'],
      currentTemp: current['temperature_2m'],
      tempUnit: currentUnits['temperature_2m'],
      currentWindSpeed: current['wind_speed_10m'],
      windSpeedUnit: currentUnits['wind_speed_10m'],
      currentHumidity: hourly['relative_humidity_2m'][index], //selected from array based on time index
      humidityUnit: hourlyUnits['relative_humidity_2m'],
    );
  }
}