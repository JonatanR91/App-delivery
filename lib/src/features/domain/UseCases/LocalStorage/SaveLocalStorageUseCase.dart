
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/LocalStorage/SaveLocalStorageRepository.dart';

import 'LocalStorageUseCaseParameters.dart';

abstract class SaveLocalStorageUseCase {
  Future<void> execute({ required SaveLocalStorageParameters parameters });
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {

  // Dependencias
  final SaveLocalStorageRepository _saveLocalStorageRepository;

  DefaultSaveLocalStorageUseCase({ SaveLocalStorageRepository? saveLocalStorageRepository })
      : _saveLocalStorageRepository = saveLocalStorageRepository ?? DefaultSaveLocalStorageRepository();

  @override
  Future<void> execute({required SaveLocalStorageParameters parameters}) async {
    _saveLocalStorageRepository.saveInLocalStorage(key: parameters.key, value: parameters.value);
  }
}