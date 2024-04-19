


 import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';

class DefaultGetUserAuthDataService extends GetUserAuthDataService {
  @override
  Future<Map<String, dynamic>> getUserAuthData({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
    
  }
  
  
}
