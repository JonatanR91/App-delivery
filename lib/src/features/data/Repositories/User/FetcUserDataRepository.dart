import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';
import '../../../../services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/Services/RealtimeDataBaseService.dart';
import '../../../../services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/interfaces.dart';
import '../../Interfaces/Interfaces.dart';

extension Paths on DefaultFetchUserDataRepository {
  static String path = "users/";
}


class DefaultFetchUserDataRepository extends FetchUserDataRepository{

  //dependencias
  RealtimeDatabaseService _realtimeDatabaseService;

  DefaultFetchUserDataRepository({RealtimeDatabaseService? realtimeDatabaseService})
          : _realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService();
  @override
  Future<Result<UserDecodable, Failure>> fetchUserData({required String localId}) async {
    var fullpath = path +localId;
    try {
      final result = await _realtimeDatabaseService.getData(path: fullpath);
      UserDecodable _decodable = UserDecodable.fromMap(result);
          return Result.success(_decodable);

    } on Failure catch(f){
      return Result.failure(f);
    }
  }

}