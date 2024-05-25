

import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:yes_no_app/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/Services/RealtimeDataBaseService.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/interfaces.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class _Paths {
  static String userCollection = "users/";
}

abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData({ required UserBodyParameters params });
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultSaveUserDataRepository({ RealtimeDataBaseService? realtimeDataBaseService })
      : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData({ required UserBodyParameters params }) async {

    if (params.localId == null) {
      return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
    }

    var path = _Paths.userCollection + params.localId!;

    try {
      final result = await _realtimeDataBaseService.putData(bodyParameters: params.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
