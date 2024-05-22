import 'package:yes_no_app/src/Base/Constants/LocasStorageKeys.dart';
import 'package:yes_no_app/src/features/domain/UseCases/LocalStorage/FetchLocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:yes_no_app/src/features/domain/UseCases/LocalStorage/RemoveLocalStorage/RemoveLocalStorageUseCase.dart';

abstract class SignOutUseCase {
  Future<void> execute();
}

class DefaultSignOutUseCase extends SignOutUseCase {

  // * Dependencies
  final RemoveLocalStorageUseCase _removeLocalStorageUseCase;

  DefaultSignOutUseCase({ RemoveLocalStorageUseCase? removeLocalStorageUseCase })
      : _removeLocalStorageUseCase =
      removeLocalStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() async {
    return _removeLocalStorageUseCase.execute(params: RemoveLocalStorageParameters(key: LocalStorageKeys.idToken));
  }
}
