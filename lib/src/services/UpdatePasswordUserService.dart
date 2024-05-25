
import 'package:yes_no_app/src/services/FirebaseSevices/FirebaseAuthService/BodyParameters/UpdatePasswordUserServiceBodyParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';



class DefaultUpdatePasswordUserService extends UpdatePasswordUserService {

  final String _requestType = "PASSWORD_RESET";

  @override
  Future<Map<String,dynamic>> updatePassword({ required String email }) async {
    final params = UpdatePasswordBodyParameters(requestType: _requestType, email: email);
    return apiService.getDataFromPostRequest(bodyParameters: params.toMap(), url: endpoint);
  }
}