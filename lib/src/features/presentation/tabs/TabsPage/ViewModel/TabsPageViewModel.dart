
import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/Base/Views/BaseView.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Geolocation/GeolocationUseCase.dart';
import 'package:yes_no_app/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:yes_no_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class TabsViewModelInput {
  // Exposed Methods
  Future<Result<bool,Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}



// Crear ViewModel
abstract class TabsViewModel extends TabsViewModelInput with BaseViewModel {}

class DefaultTabsViewModel extends TabsViewModel {
  // Dependencies
  final GeolocationUseCase _geolocationUseCase;

  DefaultTabsViewModel({ GeolocationUseCase? geolocationUseCase })
      : _geolocationUseCase = geolocationUseCase ?? DefaultGeolocationUseCase();

  @override
  void initState({ required LoadingStateProvider loadingState }) {
    loadingStatusState = loadingState;
  }

  @override
  Future<Result<bool, Failure>> getCurrentPosition() async {

    return await _geolocationUseCase.getCurrentPosition().then( (result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(true);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

  Future<LocationPermissionStatus> getPermissionStatus() async {
    return await _geolocationUseCase.getPermissionStatus();
  }
}
