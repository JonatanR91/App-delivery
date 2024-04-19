
import 'package:yes_no_app/src/Base/ApiService/ApiService.dart';
import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/interfaces.dart';


class DefaultRealtimeDatabaseService extends RealtimeDatabaseService {

  final ApiService _apiService;

  DefaultRealtimeDatabaseService({ApiService? apiService }) : _apiService = apiService ?? DefaultApiService();

  @override
  Future<Map<String, dynamic>> getData({required String path}) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiService.getDataFromGetRequest(url: endpoint);
      return result;
    } on Failure catch(f) {
      return f.error;
    }
  }

  @override
  Future<Map<String, dynamic>> postData({required Map<String, dynamic> bodyParamaters, required String path}) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiService.getDataFromPostRequest(bodyParameters: bodyParamaters, url: endpoint);
      return result;
    } on Failure catch(f) {
      return f.error;
    }
  }

  @override
  Future<Map<String, dynamic>> putData({required Map<String, dynamic> bodyParamaters, required String path}) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiService.getDataFromPutRequest(bodyParameters: bodyParamaters, url: endpoint);
      return result;
    } on Failure catch(f) {
      return f.error;
    }
  }

}