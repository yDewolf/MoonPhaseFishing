import 'package:fish_phases/api/location_service.dart';
import 'package:fish_phases/api/models/moon_phase_model.dart';
import 'package:fish_phases/api/usno_client.dart';
import 'package:geolocator/geolocator.dart';

// Usem isso aqui nas telas para conseguir puxar as informações
class ApiWrapper {
  LocationService location_service = LocationService(); 
  UsnoApiClient usno_api = UsnoApiClient();

  // Isso aqui vai puxar as informações da API
  // Aí os dados vão estar estruturados com base nesse arquivo aqui: moon_phase_model.dart
  Future<MoonPhaseModel?> getLocalMoonData() async {
    try {
        Position position = await location_service.getCurrentLocation();
        print('Lat: ${position.latitude}, Lng: ${position.longitude}');

        String today = DateTime.now().toString().split(' ')[0];
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
}