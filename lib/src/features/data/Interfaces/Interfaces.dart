
// Auth Repositories
import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:yes_no_app/src/services/Decodables/SignInDecodable.dart';
import 'package:yes_no_app/src/services/Decodables/SignUpDecodable.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

import '../../../services/Decodables/UpdatePasswordDecorable.dart';
import '../Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import '../Repositories/Auth/SignUpRepository/SignUpRepositoryParameters.dart';
import '../Repositories/User/UserBodyParameters.dart';

//Auth Reposotories

abstract class SignInRepository{
  Future<Result<SingInDecodable, Failure>>  signIn({required SignInBodyParameters params});
}

abstract class SignUpRepository{
  Future<Result<SingUpDecodable, Failure>> sigUp({required SignUpRepositoryParameters params});
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({required String email});
}

abstract class UserAuthDataRepository{
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData ({required GetUserDataBodyParameters parameters});
}

// User database  Repositories
abstract class SaveUserDataRepository{
  Future<Result<UserDecodable, Failure>>saveUserData({required UserBodyParameters parameters});
}

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData({required String localId});
}

// Local Storage
abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({ required String key, required String value });
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({ required String key });
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({ required String key });
}