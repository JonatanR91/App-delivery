

import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/SignUpRepository/SignUpRepository.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/SignUpRepository/SignUpRepositoryParameters.dart';
import 'package:yes_no_app/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:yes_no_app/src/features/domain/Entities/User/UserEntity.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpuseCaseParameters.dart';
import 'package:yes_no_app/src/utils/Helpers/Dates/DateHelpers.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

import '../../../../../utils/Helpers/UserPhotos/UserPgotoHelper.dart';
import '../../User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import '../../User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameters params});
}

class DefaultSignUpUseCase extends SignUpUseCase {
  //dependence

  final SignUpRepository _signUpRepository;
    final SaveUserDataUseCase _saveUserDataUseCase ;

  DefaultSignUpUseCase({SignUpRepository? signUpRepository, SaveUserDataUseCase? saveUserDataUseCase })
      : _signUpRepository = signUpRepository ?? DefaultsignUpRepository(),
        _saveUserDataUseCase = saveUserDataUseCase ?? DefaultSeveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameters params}) {
   return _signUpRepository.sigUp(params: SignUpRepositoryParameters(email: params.email, password: params.password)).then( (result) {
      switch (result.status){
        case ResultStatus.success:
          if(result.value == null){
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          SignUpEntity entity = SignUpEntity.fromMap(result.value!.toMap());
          return saveUserDataInDataBase(params: params,
              entity: entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

}
extension on  DefaultSignUpUseCase {

  Future<Result<SignUpEntity, Failure>> saveUserDataInDataBase({ required SignUpUseCaseParameters params, required SignUpEntity entity}){
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
      localId: entity.localId,
      role: UserRole.user,
      username:  params.username,
      phone: params.phone,
      dateOfBirth: params.date,
      startDate: DateHelpers.getstarData(),
      photo: UserPhotoHelper.defaultUserPhoto,
      shippingAddress: '',
      billingAddress: '',
      idToken: entity.idToken
    );

    return _saveUserDataUseCase.execute(parameters: _params).then((result){
      switch (result.status){

        case ResultStatus.success:
         return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

}