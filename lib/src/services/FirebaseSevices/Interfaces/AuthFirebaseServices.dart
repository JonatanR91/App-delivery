import 'package:yes_no_app/src/Base/ApiService/ApiService.dart';

abstract class BaseFirebaseService {
  ApiService apiService = DefaultApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String signUpEndpoint = "accounts:signUp?key=";
  static String signInEndpoint = "accounts:signInWithPassword?key=";
  static String updatePasswordEndpoint= "accounts:sendOobCode?key=";
  static String getUserDataEndpoint = "accounts:lookup?key=";
  static String updateEmailEndpoint = "accounts:update?key=";
  static String adminToken = "AIzaSyBaedKNUOCdYeGRb1as7CMXfoKSv1faIUM";
}


abstract class SignUpService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl + BaseFirebaseService.signUpEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> signUp({ required Map<String, dynamic> bodyParameters });
}

abstract class SignInService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl + BaseFirebaseService.signInEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> signIn({ required Map<String, dynamic> bodyParameters });
  Future<String> getIdToken({ required Map<String, dynamic> bodyParameters });
}

abstract class GetUserDataService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl + BaseFirebaseService.getUserDataEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> getUserData({ required Map<String, dynamic> bodyParameters });
}

abstract class UpdatePasswordUserService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl + BaseFirebaseService.updatePasswordEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> updatePassword({ required String email });
}

abstract class UpdateEmailUserService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl + BaseFirebaseService.updateEmailEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> updateEmail({ required String oldEmail, required String newEmail, required String password });
}
