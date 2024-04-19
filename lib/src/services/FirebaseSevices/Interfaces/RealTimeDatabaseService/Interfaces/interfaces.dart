

abstract class BaseRealTimeDatabaseService {
  String baseUrl = "https://delivery-app-flutter-yt-2736b-default-rtdb.firebaseio.com/";
  String endUrl = ".json";
}

abstract class RealtimeDatabaseService extends BaseRealTimeDatabaseService {
  Future<Map<String,dynamic>> postData({ required Map<String,dynamic> bodyParamaters,
    required String path});
  Future<Map<String,dynamic>> putData({ required Map<String,dynamic> bodyParamaters,
    required String path});
  Future<Map<String,dynamic>> getData({ required String path });
}