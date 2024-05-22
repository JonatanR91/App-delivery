import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/UserAuthData/UserAuthDataUseCase.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/UserAuthData/UserAuthDataUseCaseBodyParameters.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class  ValidateCurrentUserUseCase {
  Future<bool> execute ({required String idToken});
}

class DefaultValidateCurrentUserUseCase extends ValidateCurrentUserUseCase{

  final UserAuthDataUseCase _authDataUseCase;

  DefaultValidateCurrentUserUseCase({ UserAuthDataUseCase? authDataUseCase })
      : _authDataUseCase =  authDataUseCase ?? DefaultUserAuthDataUseCase();

  @override
  Future<bool> execute({required String idToken}) async {
    try {
      return _authDataUseCase.execute(parameters: GetUserDataUseCaseParameters(idToken: idToken)).then((result){
        switch (result.status){
          case ResultStatus.success:
            return true;
          case ResultStatus.error:
            return false;
        }
        });
    } on Failure {
      return false;
    }
  }
}