
import 'package:flutter_test/flutter_test.dart';
import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/domain/Entities/Auth/SignInEntity/SignInEntity.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:yes_no_app/src/services/Decodables/AuthErrorDecodable.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';



abstract class _Constants {
  static String correctEmail = "david9@gmail.com";
  static String correctPass = "123456833";
  static String wrongEmail = "david19@gmail.com";
  static String wrongPass = "1234568";
}


void   main(){
  //Given
  final SignInUseCase sut = DefaultSignInUseCase();

  group('Test success response to SignInUseCase', () {
    test('Test success signIn feature with email and password', () async{
    //given
    final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(email: _Constants.correctEmail,
                                                                            password: _Constants.correctPass);
    //When
      var result = await sut.execute(params: _params);
      switch (result.status){
        case ResultStatus.success:
          expect(result.value, isA<SignInEntity>());
          break;
        case  ResultStatus.error:
          //Then
          expect(result.error, Failure);
          break;
      }
    });
  });

  group('Test failure response to SignInUseCase', ()  {
  test('Test failure response to SignInUseCase', () async{
    final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(email: _Constants.correctEmail,
        password: _Constants.correctPass);

    try{
      final _ =  await sut.execute(params: _params);

    } on Failure catch(f){
      AuthErrorDecodable _error = f as AuthErrorDecodable;
      //THEN
      expect(_error.error!.message, FBFailureMessages.emailNotFoundMessage);
    }
  });

  test('Test failure response to SignInUseCase with wrong password', () async{
    final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(email: _Constants.correctEmail,
        password: _Constants.wrongEmail);

    try{
      final _ =  await sut.execute(params: _params);

    } on Failure catch(f){
      AuthErrorDecodable _error = f as AuthErrorDecodable;
      //THEN
      expect(_error.error!.message, FBFailureMessages.invalidPasswordMessage);
    }
  });

  });
}