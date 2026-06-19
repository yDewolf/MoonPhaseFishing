import 'package:dio/dio.dart';
import 'package:fish_phases/api/models/weather_model.dart';

class WeatherApiClient {
  final Dio _dio;

  WeatherApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://api.open-meteo.com/v1',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));

  Future<WeatherModel?> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _dio.get(
        '/forecast',
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'current': 'temperature_2m,weather_code,wind_speed_10m,wind_direction_10m',
          'timezone': 'auto', 
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final currentJson = response.data['current'] as Map<String, dynamic>;
        return WeatherModel.fromJson(currentJson);
      }
      return null;
    } on DioException catch (e) {
      print('Erro ao buscar clima no Open-Meteo: ${e.message}');
      rethrow;
    }
  }
}