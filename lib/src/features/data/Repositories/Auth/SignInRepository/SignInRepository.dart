import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/FirebaseAuthService/Decodables/SignInDecodable.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';
import 'package:yes_no_app/src/services/SignInAuthService.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

class DefaultSignInRepository extends SignInRepository {
  //dependencias
  final SignInService _signInService;

  DefaultSignInRepository({SignInService? signInService})
        :_signInService = signInService ?? DefaultSignInService();

  @override
  Future<Result<SignInDecodable, Failure>> signIn({required SignInBodyParameters params}) async {
      try {
        final result = await _signInService.signIn(bodyParameters: params.toMap());
        SignInDecodable decodable = SignInDecodable.fromMap(result);

        return Result.success(decodable);
      } on Failure catch(f){
        return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
      }
  }
  
}