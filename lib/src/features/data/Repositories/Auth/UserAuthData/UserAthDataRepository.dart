

import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/features/data/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/GetUserAuthDataService.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

class DefaultUserAuthDataRepository extends UserAuthDataRepository {

  //Dependencias

  final GetUserAuthDataService _getUserAuthDataService;

  DefaultUserAuthDataRepository({GetUserAuthDataService? getUserAuthDataService})
        : _getUserAuthDataService = getUserAuthDataService ?? DefaultGetUserAuthDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData({required GetUserDataBodyParameters parameters}) async {

    try{
      final result = await _getUserAuthDataService.getUserAuthData(bodyParameters: parameters.toMap());
          UserAuthDataDecodable _decodable = UserAuthDataDecodable.fromMap(result);
          return Result.success(_decodable);
    } on Failure catch(f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }

  }

}


