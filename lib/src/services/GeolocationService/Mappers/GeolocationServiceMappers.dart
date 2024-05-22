
import 'package:geolocator/geolocator.dart';
import 'package:yes_no_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';

class GeolocationServiceMapper {
  static PositionEntity mapPosition(Position position) {
    // Aquí en este punto podemos probar
    print("Geolocation- Longitud: ${ position.longitude }");
    print("Geolocation- Latitud: ${ position.latitude }");

    return PositionEntity(longitude: position.longitude,
        latitude: position.latitude,
        timestamp: position.timestamp,
        accuracy: position.accuracy,
        altitude: position.altitude,
        heading: position.heading,
        speed: position.speed,
        speedAccuracy: position.speedAccuracy);
  }
}