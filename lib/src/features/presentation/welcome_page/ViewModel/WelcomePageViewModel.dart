
import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/Base/Views/BaseView.dart';
import 'package:yes_no_app/src/features/Domain/Entities/User/UserEntity.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:yes_no_app/src/features/presentation/Stateprovider/LoadingStateProvider.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class WelcomePageViewModelInput {
  Future<Result<UserEntity,Failure>> signInWithGoogle();
}

abstract class WelcomePageViewModel extends WelcomePageViewModelInput with BaseViewModel {}

class DefaultWelcomePageViewModel extends WelcomePageViewModel {

  // Dependencias
  final GoogleSignInUseCase _googleSignInUseCase;

  DefaultWelcomePageViewModel({
    GoogleSignInUseCase? googleSignInUseCase
  }) : _googleSignInUseCase = googleSignInUseCase ?? DefaultGoogleSignInUseCase();

  @override
  Future<Result<UserEntity,Failure>> signInWithGoogle() {
    return _googleSignInUseCase.execute();
  }

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }
}