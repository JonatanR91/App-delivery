

import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/SignUpRepository/SignUpBodyParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/FirebaseAuthService/Decodables/SignUpDecodable.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';
import 'package:yes_no_app/src/services/SignUpAuthSevice.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class SignUpRepository {
  Future<Result<SignUpDecodable, Failure>> signUp({ required SignUpBodyParameters params });
}

class DefaultSignUpRepository extends SignUpRepository {

  // * Dependencies
  final SignUpService _signUpService;

  DefaultSignUpRepository({ SignUpService? signUpService }) : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp({ required SignUpBodyParameters params }) async {
    try {
      final result = await _signUpService.signUp(bodyParameters: params.toMap());
      SignUpDecodable decodable = SignUpDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
