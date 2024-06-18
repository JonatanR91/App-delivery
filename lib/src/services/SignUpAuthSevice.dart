import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';
class DefaultSignUpService extends SignUpService {
  @override
  Future<Map<String,dynamic>> signUp({required Map<String,dynamic> bodyParameters}) async {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }
}