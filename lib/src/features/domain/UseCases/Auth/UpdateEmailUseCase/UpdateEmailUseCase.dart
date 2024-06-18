import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/SignInRepository/UpdateEmail/UpdateEmailRepository.dart';
import 'package:yes_no_app/src/features/domain/Entities/User/UserEntity.dart';
import 'package:yes_no_app/src/features/domain/UseCases/User/FetchUserDataUseCase/FetchUserDataUseCase.dart';
import 'package:yes_no_app/src/features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class UpdateEmailUseCase {
  Future<UserEntity?> execute({ required String oldEmail,
    required String newEmail,
    required String password,
    required String localId });
}

class DefaultUpdateEmailUseCase extends UpdateEmailUseCase {

  // * Dependencies
  final UpdateEmailRepository _updateEmailRepository;
  final FetchUserDataUseCase _fetchUserDataUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultUpdateEmailUseCase({ UpdateEmailRepository? updateEmailRepository,
    FetchUserDataUseCase? fetchUserDataUseCase,
    SaveUserDataUseCase? saveUserDataUseCase })
      : _updateEmailRepository = updateEmailRepository ?? DefaultUpdateEmailRepository(),
        _fetchUserDataUseCase = fetchUserDataUseCase ?? DefaultFetchUserDataUseCase(),
        _saveUserDataUseCase = saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<UserEntity?> execute({ required String oldEmail,
    required String newEmail,
    required String password,
    required String localId }) async {
    try {
      final _ = await _updateEmailRepository.updateEmail(oldEmail: oldEmail, newEmail: newEmail, password: password);
      return await _updateEmailInDataBase(newEmail: newEmail, localId: localId);
    } on Failure catch (f) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

  Future<UserEntity?> _updateEmailInDataBase({ required String newEmail, required String localId }) async {
    try {
      var userData = await _fetchUserDataUseCase.execute(localId: localId);
      userData.email = newEmail;
      _saveUserDataUseCase.execute(params: userData.getSaveUserDataParams()).then((result) {
        switch (result.status) {
          case ResultStatus.success:
            return result.value;
          case ResultStatus.error:
            return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
        }
      });

    } on Failure catch (f) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

}