import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/UserAuthData/UserAuthDataUseCase.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/UserAuthData/UserAuthDataUseCaseBodyParameters.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class ValidateCurrentUserCase {
  Future<bool> execute({required String idToken});
}

class DefaultValidateCurrentUserCase extends ValidateCurrentUserCase {

  // * Dependencies
  final GetUserAuthDataUseCase _getUserAuthDataUseCase;

  DefaultValidateCurrentUserCase({ GetUserAuthDataUseCase? getUserAuthDataUseCase })
      : _getUserAuthDataUseCase =
      getUserAuthDataUseCase ?? DefaultGetUserAuthDataUseCase();

  @override
  Future<bool> execute({required String idToken}) async {
    try {
      return _getUserAuthDataUseCase
          .execute(params: GetUserDataUseCaseParameters(idToken: idToken))
          .then((result) {
        switch (result.status) {
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
