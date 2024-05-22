import 'package:yes_no_app/src/services/GoogleSignInService/Entities/GoogleSignInUserEntity.dart';

abstract class GoogleSignInService {
  Future<GoogleSignInUserEntity> signInWithGoogle();
  Future<bool> isUserInDatabase({ required String uid });
}