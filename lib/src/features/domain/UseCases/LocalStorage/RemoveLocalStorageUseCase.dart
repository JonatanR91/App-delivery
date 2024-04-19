
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/LocalStorage/RemoveLocalStorageRepository.dart';

import 'LocalStorageUseCaseParameters.dart';

abstract class RemoveLocalStorageUseCase {
  Future<void> execute({ required RemoveLocalStorageParameters parameters });
}

class DefaultRemoveLocalStorageUseCase extends RemoveLocalStorageUseCase {

  // Dependencias
  final RemoveLocalStorageRepository _removeLocalStorageRepository;

  DefaultRemoveLocalStorageUseCase({ RemoveLocalStorageRepository? removeLocalStorageRepository })
      : _removeLocalStorageRepository = removeLocalStorageRepository ?? DefaultRemoveLocalStorageRepository();

  @override
  Future<void> execute({required RemoveLocalStorageParameters parameters}) async {
    return await _removeLocalStorageRepository.removeInLocalStorage(key: parameters.key);
  }
}