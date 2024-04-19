

import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/UserAuthData/UserAthDataRepository.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

import '../../../Entities/Auth/UserAuthData/UserAuthEntity.dart';
import 'UserAuthDataUseCaseBodyParameters.dart';

abstract class UserAuthDataUseCase {


  Future<Result<UserAuthDataEntity, Failure>> execute({required  GetUserDataUseCaseParameters parameters});

}

class DefaultUserAuthDataUseCase extends UserAuthDataUseCase{
  //dependencias
  final UserAuthDataRepository _userAuthDataRepository;
DefaultUserAuthDataUseCase({UserAuthDataRepository? userAuthDataRepository})
      : _userAuthDataRepository = userAuthDataRepository ?? DefaultUserAuthDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute({required GetUserDataUseCaseParameters parameters}) {
    return _userAuthDataRepository.getUserAuthData(parameters: GetUserDataBodyParameters(idToken: parameters.idToken)).then((result)  {
     switch (result.status) {
       case ResultStatus.success:
         if (result.value == null){
           return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
         }
         return Result.success(UserAuthDataEntity.fromMap(result.value!.toMap()));
       case ResultStatus.error:

         return Result.failure(result.error);
     }
    });
  }


}