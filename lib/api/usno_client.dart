import 'package:dio/dio.dart';
import 'models/moon_phase_model.dart';

class UsnoApiClient {
  final Dio _dio;

  UsnoApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://aa.usno.navy.mil/api/rstt',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));

  Future<MoonPhaseModel?> getMoonData({
    required DateTime date,
    required double latitude,
    required double longitude,
    required String timezone
  }) async {
    try {
      print("Starting USNO request $latitude $longitude");
      final dateString = "${date.year}-${date.month}-${date.day}";

      // 2. Remove o sinal de menos usando .abs() e fixa em 2 casas decimais
      final latClean = latitude.abs().toStringAsFixed(2);
      final lngClean = longitude.abs().toStringAsFixed(2);

      // 3. Monta o parâmetro coords puramente com os números positivos
      // Resultado esperado: 23.55,46.63
      final coordsParam = '$latClean,$lngClean';
      final rotaCompleta = '/rstt/oneday?date=$dateString%20&coords=$coordsParam';
      print('DEBUG - URL Oficial: https://aa.usno.navy.mil/api$rotaCompleta');
      final response = await _dio.get(rotaCompleta);

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