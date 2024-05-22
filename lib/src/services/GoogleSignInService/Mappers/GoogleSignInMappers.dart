
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yes_no_app/src/services/GoogleSignInService/Entities/GoogleSignInUserEntity.dart';

class GoogleSignInMapper {
  static GoogleSignInUserEntity mapUserCredential(UserCredential credential, String? idToken) {
    return GoogleSignInUserEntity(credential.user, idToken);
  }
}