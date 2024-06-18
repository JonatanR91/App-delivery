import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Geolocation/GeolocationUseCaseParameters.dart';
import 'package:yes_no_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:yes_no_app/src/services/GeolocationService/Interfaces/GeolocationServiceInterfaces.dart';
import 'package:yes_no_app/src/services/GeolocationService/Service/GeolocationService.dart';
import 'package:yes_no_app/src/services/GeolocationService/Service/GeolocationServiceHelper.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class GeolocationUseCase {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
  Future<double> getDistanceBetweenYourCurrentPositionAnd(Destination destination);
}

class DefaultGeolocationUseCase extends GeolocationUseCase {

  // Dependencias
  final GeolocationService _geolocationService;
  final GeolocationServiceHelper _geolocationHelpersService;

  DefaultGeolocationUseCase({
    GeolocationService? geolocationService,
    GeolocationServiceHelper? geolocationHelpersService
  }) : _geolocationService = geolocationService ?? DefaultGeolocationService(),
        // Bueno: DefaultGeolocationService() Pruebas: MockGeolocationService()
        _geolocationHelpersService = geolocationHelpersService ?? DefaultGeolocationServiceHelper();

  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() {
    return _geolocationService.getCurrentPosition();
  }

  @override
  Future<double> getDistanceBetweenYourCurrentPositionAnd(Destination destination) async {
    final userPosition = await _geolocationService.getCurrentPosition();
    return _geolocationHelpersService.getDistanceBetweenInKilometters(userPosition.value?.latitude ?? 0.0,
        userPosition.value?.longitude ?? 0.0,
        destination.destinationLatitude,
        destination.destinationLongitude);
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() {
    return _geolocationService.getPermissionStatus();
  }
}