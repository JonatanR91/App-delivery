import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/UserAuthData/UserAthDataRepository.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';
import '../../../Entities/Auth/UserAuthData/UserAuthEntity.dart';
import 'UserAuthDataUseCaseBodyParameters.dart';

abstract class GetUserAuthDataUseCase {
  Future<Result<UserAuthDataEntity, Failure>> execute({ required GetUserDataUseCaseParameters params });
}

class DefaultGetUserAuthDataUseCase extends GetUserAuthDataUseCase {

  // * Dependencies
  final GetAuthUserDataRepository _getAuthUserDataRepository;

  DefaultGetUserAuthDataUseCase(
      { GetAuthUserDataRepository? getAuthUserDataRepository })
      : _getAuthUserDataRepository = getAuthUserDataRepository ?? DefaultGetAuthUserDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute(
      {required GetUserDataUseCaseParameters params}) {
    return _getAuthUserDataRepository
        .getUserData(params: GetUserDataBodyParameters(idToken: params.idToken))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserAuthDataEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
