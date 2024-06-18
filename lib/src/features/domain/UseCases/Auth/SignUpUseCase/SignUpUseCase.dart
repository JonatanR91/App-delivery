import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/Domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/SignUpRepository/SignUpBodyParameters.dart';
import 'package:yes_no_app/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:yes_no_app/src/features/domain/Entities/User/UserEntity.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpuseCaseParameters.dart';
import 'package:yes_no_app/src/features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:yes_no_app/src/utils/Helpers/Dates/DateHelpers.dart';
import 'package:yes_no_app/src/utils/Helpers/UserPhotos/DefaulUserPhotoHelper.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

import '../../../../data/Repositories/Auth/SignUpRepository/SignUpRepository.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameters params});
}

class DefaultSignUpUseCase extends SignUpUseCase {

  // * Dependencies
  final SignUpRepository _signUpRepository;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase({ SignUpRepository? signUpRepository,
    SaveUserDataUseCase? saveUserDataUseCase})
      : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameters params}) {
    return _signUpRepository
        .signUp(params: SignUpBodyParameters(email: params.email,
        password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
        // Null Check
          if (result.value == null) {
            return Result.failure(
                Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return saveUserDataInDataBase(params: params, entity: SignUpEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

extension on DefaultSignUpUseCase {
  Future<Result<SignUpEntity, Failure>> saveUserDataInDataBase({required SignUpUseCaseParameters params,
    required SignUpEntity entity }) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        localId: entity.localId,
        //role: UserRole.user,
        username: params.username,
        email: entity.email,
        phone: params.phone,
        dateOfBirth: params.date,
        startDate: DateHelpers.getStartDate(),
        photo: DefaultUserPhotoHelper.defaultUserPhoto,
        shippingAddress: '',
        billingAddress: '',
        idToken: entity.idToken,
        provider: UserAuthProvider.emailAndPassword
    );

    return _saveUserDataUseCase.execute(params: _params ).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}