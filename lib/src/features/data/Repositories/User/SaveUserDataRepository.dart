

import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/Services/RealtimeDataBaseService.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/interfaces.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class _Paths{
  static String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {

  // dependencias
  RealtimeDatabaseService _realtimeDatabaseService;
  DefaultSaveUserDataRepository({RealtimeDatabaseService? realtimeDatabaseService})
    :_realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData({required UserBodyParameters parameters}) async {
    if(parameters.localId == null){
      return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
    }
    //Creamos el path
    var path = _Paths.userCollection + parameters.localId!;
    try {
      final result = await _realtimeDatabaseService.putData(bodyParamaters: parameters.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
        return Result.success(decodable);
    } on Failure catch(f){
      return Result.failure(f);
    }
  }
  
}