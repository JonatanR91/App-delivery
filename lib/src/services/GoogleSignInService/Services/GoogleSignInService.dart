

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/Services/RealtimeDataBaseService.dart';
import 'package:yes_no_app/src/services/GoogleSignInService/Entities/GoogleSignInUserEntity.dart';
import 'package:yes_no_app/src/services/GoogleSignInService/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/services/GoogleSignInService/Mappers/GoogleSignInMappers.dart';

import '../../FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/interfaces.dart';

class DefaultGoogleSignInService extends GoogleSignInService {
  final RealtimeDataBaseService _realtimeDatabaseService;
  String _path = "users/";

  // Dependencies
  DefaultGoogleSignInService({ RealtimeDataBaseService? realtimeDataBaseService })
      : _realtimeDatabaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<GoogleSignInUserEntity> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return GoogleSignInMapper.mapUserCredential(userCredential,
        googleAuth?.idToken);
  }

  @override
  Future<bool> isUserInDatabase({ required String uid }) async {
    final fullpath = _path + uid;
    try {
      final result = await _realtimeDatabaseService.getData(path: fullpath);
      return result.isNotEmpty;
    } on Failure catch (f) {
      return false;
    }
  }
}