import '../../../../../Base/ApiService/AppError.dart';
import '../../../../../Base/Constants/ErrorMessages.dart';
import '../../../../../utils/Helpers/resultType/ResultType.dart';
import '../../../../data/Repositories/User/FetcUserDataRepository.dart';
import '../../../Entities/User/UserEntity.dart';

abstract class FetchUserDataUseCase{

  Future<Result<UserEntity, Failure>> execute ({required String localId});
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {
  //Dependencias
  final DefaultFetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase({DefaultFetchUserDataRepository? fetchUserDataRepository})
    : _fetchUserDataRepository = fetchUserDataRepository ?? DefaultFetchUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({required String localId}) {
    return _fetchUserDataRepository.fetchUserData(localId: localId).then((result) {
      switch (result.status){

        case ResultStatus.success:
          if(result.value == null){
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }


}