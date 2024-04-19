
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/LocalStorage/FetchLocalStorageRepository.dart';

import 'LocalStorageUseCaseParameters.dart';

abstract class FetchLocalStorageUseCase {
  Future<String?> execute({ required FetchLocalStorageParameters parameters });
}

class DefaultFetchLocalStorageUseCase extends FetchLocalStorageUseCase {

  // Dependencias
  final FetchLocalStorageRepository _fetchLocalStorageRepository;

  DefaultFetchLocalStorageUseCase({ FetchLocalStorageRepository? fetchLocalStorageRepository })
      : _fetchLocalStorageRepository = fetchLocalStorageRepository ?? DefaultFetchLocalStorageRepository();

  @override
  Future<String?> execute({required FetchLocalStorageParameters parameters}) async {
    return await _fetchLocalStorageRepository.fetchInLocalStorage(key: parameters.key);
  }
}