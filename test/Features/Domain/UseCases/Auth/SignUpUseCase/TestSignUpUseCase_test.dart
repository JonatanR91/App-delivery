
import 'package:flutter_test/flutter_test.dart';
import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpuseCaseParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/FirebaseAuthService/Decodables/AuthErrorDecodable.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';


abstract class _Constants {
  static String correctEmail = "dr607430@gmail.com";
  static String correctPass = "123456";
  static String wrongEmail = "david9@gmail.com";
  static String wrongPass = "12345678";
}

void main() {
  // GIVEN
  SignUpUseCase sut = DefaultSignUpUseCase();

  group('Test success SignUp user in Firebase', () {
    test('Test success signUp user in Firebase', () async {
      final SignUpUseCaseParameters params = SignUpUseCaseParameters(
          email: _Constants.correctEmail,
          password: _Constants.correctPass,
          username: 'DavidR',
          date: '22/10/1989',
          phone: '123456'
      );

      // WHEN
      final result = await sut.execute(params: params);

      switch (result.status) {
        case ResultStatus.success:
        // THEN
          expect(result.value, isA<SignUpEntity>());
          break;
        case ResultStatus.error:
        // THEN
          expect(result.error, Failure);
          break;
      }
    });
    // TODO: Añadir más test ;)
  });

  group('Test failure SignUp in Firebase', () {
    test('Test failure SignUp in Firebase', () async {
      try {
        // WHEN
        final SignUpUseCaseParameters params = SignUpUseCaseParameters(
            email: _Constants.wrongEmail,
            password: _Constants.wrongPass,
            username: 'Cane 2',
            date: '22/10/1989',
            phone: '123456'
        );
        final _ = await sut.execute(params: params);
      } on Failure catch(f) {
        // THEN
        AuthErrorDecodable _error = f as AuthErrorDecodable;
        expect(_error.error!.message, FBFailureMessages.emailExistMessage);
      }
    });

    // TODO: Añadir más test ;)
  });
}