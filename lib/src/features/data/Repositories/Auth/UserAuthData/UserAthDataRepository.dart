
import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/features/data/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/GetUserAuthDataService.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class GetAuthUserDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserData({ required GetUserDataBodyParameters params });
}

class DefaultGetAuthUserDataRepository extends GetAuthUserDataRepository {

  // * Dependencies
  final GetUserDataService _getUserDataService;

  DefaultGetAuthUserDataRepository({GetUserDataService? userDataService})
      : _getUserDataService = userDataService ?? DefaultGetUserDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserData({ required GetUserDataBodyParameters params }) async {
    try {
      final result = await _getUserDataService.getUserData(bodyParameters: params.toMap());
      return Result.success(UserAuthDataDecodable.fromMap(result));
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
