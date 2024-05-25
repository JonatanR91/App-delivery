

abstract class BaseRealTimeDataBaseFirebase {
  String baseUrl = "https://delivery-app-flutter-yt-2736b-default-rtdb.firebaseio.com/";
  String adminToken = "AIzaSyBaedKNUOCdYeGRb1as7CMXfoKSv1faIUM";
  String endUrl = ".json";
}

abstract class RealtimeDataBaseService extends BaseRealTimeDataBaseFirebase {
  Future<Map<String, dynamic>> postData({ required Map<String, dynamic> bodyParameters, required String path });
  Future<Map<String, dynamic>> putData({ required Map<String, dynamic> bodyParameters, required String path });
  Future<Map<String, dynamic>> getData({ required String path });
}
