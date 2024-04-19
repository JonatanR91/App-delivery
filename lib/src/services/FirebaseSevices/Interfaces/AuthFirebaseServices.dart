import 'package:yes_no_app/src/Base/ApiService/ApiService.dart';

abstract class BaseFirebaseService {
  ApiService apiService = DefaultApiService();
  static String baseurl = "https://identitytoolkit.googleapis.com/v1/";
  static String signUpEndpoint = "accounts:signUp?key=";
  static String singnInEndpoint = "accounts:signInWithPassword?key=";
  static String updatePasswordEndpoint = "accounts:sendOobCode?key=";
  static String getUserDataEndpoint = "accounts:lookup?key=";
  static String adminToken = "AIzaSyBaedKNUOCdYeGRb1as7CMXfoKSv1faIUM";
}
abstract class SignUpService extends BaseFirebaseService{
String endpoint = BaseFirebaseService.baseurl + BaseFirebaseService.signUpEndpoint + BaseFirebaseService.adminToken;
Future<Map<String,dynamic>> signUp({ required Map<String,dynamic> bodyParameters});
}
abstract class SignInService extends BaseFirebaseService{
  String endpoint = BaseFirebaseService.baseurl + BaseFirebaseService.singnInEndpoint+ BaseFirebaseService.adminToken;
  Future<Map<String,dynamic>> signIn({ required Map<String,dynamic> bodyParameters});
}

abstract class  UpdatePasswordUserService extends BaseFirebaseService {
   String endpoint = BaseFirebaseService.baseurl + BaseFirebaseService.updatePasswordEndpoint + BaseFirebaseService.adminToken;
   Future<Map<String,dynamic>> updatePassword({ required String email});
}

abstract class GetUserAuthDataService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseurl + BaseFirebaseService.getUserDataEndpoint + BaseFirebaseService.adminToken;
  Future<Map<String,dynamic>> getUserAuthData({ required Map<String, dynamic> bodyParameters });
}

