import 'package:yes_no_app/src/features/domain/UseCases/Auth/UpdatePasswordUsercase/UpdatePasswordUserCase.dart';

abstract class ForgotPasswordViewModelInput{
  late String email;
  Future<void> updatePassword();

}

abstract class ForgotPasswordViewModel extends ForgotPasswordViewModelInput {}

class DefaultForgotPasswordViewModel extends ForgotPasswordViewModel {
// Dependencies

final UpdatePasswordUseCase _updatePasswordUseCase;

DefaultForgotPasswordViewModel ({ UpdatePasswordUseCase? updatePasswordUseCase })
      : _updatePasswordUseCase = updatePasswordUseCase ?? DefaultUpdatePasswordUseCase();

  @override
  Future<void> updatePassword() {
   return _updatePasswordUseCase.execute(email: email);
  }

}