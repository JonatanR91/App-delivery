
import 'dart:html';
import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/FirebaseAuthService/Decodables/UpdatePasswordDecodable.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

import '../../../../../services/UpdatePasswordUserService.dart';

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository {

  //dependencies

  final UpdatePasswordUserService _updatePasswordUserService;

  DefaultUpdatePasswordRepository({UpdatePasswordUserService? updatePasswordUserService})
     : _updatePasswordUserService = updatePasswordUserService ?? DefaultUpdatePasswordUserService();
  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({required String email}) async {
  
    try {
      final result = await _updatePasswordUserService.updatePassword(email: email);
      UpdatePasswordDecodable _decodable = UpdatePasswordDecodable.fromMap(result);
      return Result.success(_decodable);

    } on Failure catch(f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    
    }
  }

}