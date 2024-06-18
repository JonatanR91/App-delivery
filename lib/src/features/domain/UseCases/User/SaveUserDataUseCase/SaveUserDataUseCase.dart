import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/Domain/Entities/User/UserEntity.dart';
import 'package:yes_no_app/src/features/Domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:yes_no_app/src/features/data/Repositories/User/SaveUserDataRepository.dart';
import 'package:yes_no_app/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters params });
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {

  // * Dependencies
  final SaveUserDataRepository _saveUserDataRepository;

  DefaultSaveUserDataUseCase({ SaveUserDataRepository? saveUserDataRepository })
      : _saveUserDataRepository = saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters params }) {

    UserBodyParameters _parameters = UserBodyParameters(
        localId: params.localId,
        role: params.role?.toShortString(),
        username: params.username,
        email: params.email,
        phone: params.phone,
        dateOfBirth: params.dateOfBirth,
        startDate: params.startDate,
        photo: params.photo,
        shippingAddress: params.shippingAddress,
        billingAddress: params.billingAddress,
        idToken: params.idToken,
        provider: params.provider
    );

    return _saveUserDataRepository.saveUserData(params: _parameters)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if(result.value == null) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
