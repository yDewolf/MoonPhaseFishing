import 'package:fish_phases/api/location_service.dart';
import 'package:fish_phases/api/models/moon_phase_model.dart';
import 'package:fish_phases/api/models/weather_model.dart';
import 'package:fish_phases/api/usno_client.dart';
import 'package:fish_phases/api/weather_client.dart';
import 'package:geolocator/geolocator.dart';

// Usem isso aqui nas telas para conseguir puxar as informações
class ApiWrapper {
  LocationService location_service = LocationService(); 
  UsnoApiClient usno_api = UsnoApiClient();
  WeatherApiClient weather_api = WeatherApiClient();

  // Isso aqui vai puxar as informações da API
  // Aí os dados vão estar estruturados com base nesse arquivo aqui: moon_phase_model.dart
  Future<MoonPhaseModel?> getLocalMoonData() async {
    try {
        Position position = await location_service.getCurrentLocation();
        print('Lat: ${position.latitude}, Lng: ${position.longitude}');

        DateTime today = DateTime.now();
        final dadosDaLua = await usno_api.getMoonData(
          date: today,
          latitude: position.latitude,
          longitude: position.longitude,
          timezone: "-3"
        );

        return dadosDaLua;
      } catch (e) {
        print('Erro no fluxo: $e');
        return null;
      }
  }

  Future<WeatherModel?> getLocalWeatherData() async {
    try {
      final position = await location_service.getCurrentLocation();
      final weather_data = await weather_api.getCurrentWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      if (weather_data != null) {
        print('Temperatura atual: ${weather_data.temperature}°C');
        print('Velocidade do Vento: ${weather_data.windSpeed} km/h');
        print('Condição: ${weather_data.weatherDescription}');
      }
      return weather_data;
    } catch (e) {
      print('Erro ao atualizar dados: $e');
      return null;
    }
  }
}