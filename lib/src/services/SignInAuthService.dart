import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';


class DefaultSignInService extends SignInService {

  @override
  Future<Map<String,dynamic>> signIn({ required Map<String,dynamic> bodyParameters }) async {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }

  @override
  Future<String> getIdToken({required Map<String, dynamic> bodyParameters }) async {
    try {
      final userData = await signIn(bodyParameters: bodyParameters);
      return userData['idToken'] as String;
    } on Failure catch (f) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }

  }
}