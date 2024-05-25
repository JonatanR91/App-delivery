import '../../../../../Base/ApiService/AppError.dart';
import '../../../../../Base/Constants/ErrorMessages.dart';
import '../../../../../utils/Helpers/resultType/ResultType.dart';
import '../../../../data/Repositories/User/FetcUserDataRepository.dart';
import '../../../Entities/User/UserEntity.dart';

abstract class FetchUserDataUseCase {
  Future<UserEntity> execute({required String localId});
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {

  // Dependencies
  final FetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase({ FetchUserDataRepository? fetchUserDataRepository })
      : _fetchUserDataRepository = fetchUserDataRepository ?? DefaultFetchUserDataRepository();

  @override
  Future<UserEntity> execute({ required String localId }) {
    return _fetchUserDataRepository
        .fetchUserData(localId: localId)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if(result.value == null) {
            return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return UserEntity.fromMap(result.value!.toMap());
        case ResultStatus.error:
          return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
      }
    });
  }
}