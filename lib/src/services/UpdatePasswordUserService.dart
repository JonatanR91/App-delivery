
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';

import 'BodyParameters/UpdatePasswordUserServiceBodyParameters.dart';

class DefaultUpdatePasswordUserService extends UpdatePasswordUserService {

  final String _requestType = "PASSWORD_RESET";
  @override
  Future<Map<String, dynamic>> updatePassword({required String email}) {
  final _params = UpdatePasswordBodyParameters(requestType: _requestType, email: email);
  return apiService.getDataFromPostRequest(bodyParameters: _params.toMap(), url: endpoint);
  }

}