import 'package:dio/dio.dart';
import 'models/moon_phase_model.dart';

class UsnoApiClient {
  final Dio _dio;

  UsnoApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://aa.usno.navy.mil/api',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));

  Future<MoonPhaseModel?> getMoonData({
    required String date,
    required double latitude,
    required double longitude,
    required String timezone
  }) async {
    try {
      // Exemplo fictício baseado nos endpoints comuns do USNO
      final response = await _dio.get('/moon/phases', queryParameters: {
        'date': date,
        'coords': '$latitude,$longitude',
        'tz': timezone,
      });

      if (response.statusCode == 200 && response.data != null) {
        return MoonPhaseModel.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print('Erro na requisição USNO: ${e.message}');
      rethrow;
    }
  }
}