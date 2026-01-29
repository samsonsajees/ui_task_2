import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/models/weather_model.dart';
import 'package:ui_task_2/services/weather_service.dart';
import 'package:ui_task_2/widgets/info_card.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> with AutomaticKeepAliveClientMixin {
  final WeatherService _service = WeatherService();
  WeatherModel? _weather;
  bool _isLoading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await _service.fetchWeather();
    if (mounted) {
      setState(() {
        _weather = data;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: AppColors.primaryBlue));
    }

    if (_weather == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Failed to load data", style: AppTextStyles.bodyXL),
            const SizedBox(height: 10),
            GestureDetector(
            onTap: () {
              setState(() => _isLoading = true);
              _loadData();
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              width: 120,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh, color: AppColors.white),
                  const SizedBox(width: 8),
                  Text("Retry", style: AppTextStyles.bodyM.copyWith(color: AppColors.white)),
                ],
              ),
            ),
          ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() => _isLoading = true);
              _loadData();
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh, color: AppColors.white),
                  const SizedBox(width: 8),
                  Text("Refresh", style: AppTextStyles.bodyM.copyWith(color: AppColors.white)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          BuildInfoCard(label: "Location", value: "Lat: ${_weather!.latitude}, Long: ${_weather!.longitude}", icon: Icons.location_on),
          const SizedBox(height: 16),
          BuildInfoCard(label: "Last Sync", value: _weather!.currentTime.replaceAll('T', ' '), icon: Icons.access_time),
          const SizedBox(height: 16),
          BuildInfoCard(label: "Temperature", value: "${_weather!.currentTemp}${_weather!.tempUnit}", icon: Icons.thermostat),
          const SizedBox(height: 16),
          BuildInfoCard(label: "Humidity", value: "${_weather!.currentHumidity}${_weather!.humidityUnit}", icon: Icons.water_drop),
          const SizedBox(height: 16),
          BuildInfoCard(label: "Wind Speed", value: "${_weather!.currentWindSpeed} ${_weather!.windSpeedUnit}", icon: Icons.air),
        ],
      ),
    );
  }
}