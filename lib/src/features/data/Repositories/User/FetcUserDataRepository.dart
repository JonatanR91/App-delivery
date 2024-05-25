import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';
import '../../../../services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/Services/RealtimeDataBaseService.dart';
import '../../../../services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/interfaces.dart';



abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData({ required String localId });
}

class DefaultFetchUserDataRepository extends FetchUserDataRepository {
  final String _path = "users/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultFetchUserDataRepository({ RealtimeDataBaseService? realtimeDataBaseService }) : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> fetchUserData({ required String localId }) async {
    var fullpath = _path + localId;
    try {
      final result = await _realtimeDataBaseService.getData(path: fullpath);
      return Result.success(UserDecodable.fromMap(result));
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}

