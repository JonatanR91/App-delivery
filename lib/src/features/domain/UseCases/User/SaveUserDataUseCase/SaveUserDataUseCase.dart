

import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/User/SaveUserDataRepository.dart';
import 'package:yes_no_app/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:yes_no_app/src/features/domain/Entities/User/UserEntity.dart';
import 'package:yes_no_app/src/features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute ({ required SaveUserDataUseCaseParameters parameters });

}

class DefaultSeveUserDataUseCase extends SaveUserDataUseCase {

  //dependencias
  final SaveUserDataRepository _saveuserDataRepository;

  DefaultSeveUserDataUseCase({ SaveUserDataRepository? saveuserDataRepository})
        : _saveuserDataRepository = saveuserDataRepository ?? DefaultSaveUserDataRepository();
  @override
  Future<Result<UserEntity, Failure>> execute({required SaveUserDataUseCaseParameters parameters}) {

    UserBodyParameters _parameters = UserBodyParameters(
        localId: parameters.localId,
        role: parameters.role?.toShortString(),
        username: parameters.username,
        email: parameters.email,
        phone: parameters.phone,
        dateOfBirth: parameters.dateOfBirth,
        startDate: parameters.startDate,
        photo: parameters.photo,
        shippingAddress: parameters.shippingAddress,
        billingAddress: parameters.billingAddress,
        idToken: parameters.idToken
      );
    
    return _saveuserDataRepository.saveUserData(parameters: _parameters).then((result){
      switch (result.status){
        case ResultStatus.success:
          if(result.value == null){
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          var _entity = UserEntity.fromMap(result.value!.toMap());
            return Result.success(_entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

}