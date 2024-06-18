import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/Managers/PlacesManager/Decodables/PlaceListDecodable.dart';
import 'package:yes_no_app/src/features/data/Decodables/CollectiosDecodable/CollectionsDecodable.dart';
import 'package:yes_no_app/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/FirebaseAuthService/Decodables/SignInDecodable.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/FirebaseAuthService/Decodables/SignUpDecodable.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/FirebaseAuthService/Decodables/UpdatePasswordDecodable.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';
import '../Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import '../Repositories/User/UserBodyParameters.dart';

//Auth Reposotories

abstract class SignInRepository{
  Future<Result<SignInDecodable, Failure>>  signIn({required SignInBodyParameters params});
}

abstract class SignUpRepository{
  Future<Result<SignUpDecodable, Failure>> sigUp({required SignInBodyParameters params});
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({required String email});
}
abstract class UpdateEmailRepository {
  Future<dynamic> updateEmail({ required String oldEmail, required String newEmail, required String password });
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
  Future<void>saveRecentSearchInLocalStorage({required String key, required List<String> value});
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({ required String key });
  Future<List<String>?> fetchRecentSearches();
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({ required String key });
}
//  Collections Repositories

abstract class CollectionsRepository {
  Future<CollectionsDecodable> fetchColletions();
}

abstract class PlaceListRepository {
  Future<PlaceListDecodable> fetchPlaceList();
  Future<PlaceListDecodable> fetchNoveltyPlaceList();
  Future<PlaceListDecodable> fetchPopularPlacesList();
  Future<PlaceListDecodable> fetchPlacesListByCategory({ required int categoryId});
  Future<PlaceListDecodable> fetchPlacesListByQuery({ required String query});
  Future<PlaceListDecodable> fetchPlacesListByRecentSearches({ required List<String> placeIds });
}