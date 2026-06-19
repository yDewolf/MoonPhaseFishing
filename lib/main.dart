import 'package:fish_phases/api/api_wrapper.dart';
import 'package:fish_phases/api/models/moon_phase_model.dart';
import 'package:fish_phases/api/models/weather_model.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiWrapper wrapper = ApiWrapper();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(onPressed:() async {
                  MoonPhaseModel? moon_data = await wrapper.getLocalMoonData();
                  print(moon_data);
              }, child: const Text("Moon")),
              TextButton(onPressed:() async {
                  WeatherModel? weather_data = await wrapper.getLocalWeatherData();
                  print(weather_data);
              }, child: const Text("Weather"))


            ],
          ),
        ),
      ),
    );
  }
}
