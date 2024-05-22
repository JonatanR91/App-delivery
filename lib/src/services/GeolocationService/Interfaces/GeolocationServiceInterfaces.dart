import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class GeolocationService {
 Future<Result<PositionEntity,Failure>> getCurrentPosition();
 Future<LocationPermissionStatus> getPermissionStatus();

}
abstract class GeolocationServiceHelper  {
     double getDistanceBetweenInMetters(double startLatitude,double startLongitude,double destinationLatitude,double destinationLongitude);
 double getDistanceBetweenInKilometters(double startLatitude,double startLongitude,double destinationLatitude,double destinationLongitude);
}