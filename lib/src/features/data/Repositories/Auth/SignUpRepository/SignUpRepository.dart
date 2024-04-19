

import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/services/Decodables/SignUpDecodable.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';
import 'package:yes_no_app/src/services/SignUpAuthSevice.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

class DefaultsignUpRepository extends SignUpRepository{
  //dependencias

  SignUpService _signUpService;

  DefaultsignUpRepository({SignUpService? signUpService})
    : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SingUpDecodable, Failure>> sigUp({required params}) async{
    try {
      final result = await _signUpService.signUp(bodyParameters: params.toMap());
      SingUpDecodable decodable = SingUpDecodable.fromMap(result);
      return Result.success(decodable);
      
    } on Failure catch(f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
 
  }

}