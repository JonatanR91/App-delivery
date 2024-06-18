import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/LocasStorageKeys.dart';
import 'package:yes_no_app/src/features/Domain/Entities/User/UserEntity.dart';
import 'package:yes_no_app/src/features/Domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:yes_no_app/src/features/domain/UseCases/LocalStorage/FetchLocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:yes_no_app/src/features/domain/UseCases/LocalStorage/SaveLocalStorage/SaveLocalStorageUseCase.dart';
import 'package:yes_no_app/src/features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:yes_no_app/src/services/GoogleSignInService/Entities/GoogleSignInUserEntity.dart';
import 'package:yes_no_app/src/services/GoogleSignInService/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/services/GoogleSignInService/Services/GoogleSignInService.dart';
import 'package:yes_no_app/src/utils/Helpers/Dates/DateHelpers.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class GoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> execute();
}

class DefaultGoogleSignInUseCase extends GoogleSignInUseCase {

  // Dependencies
  final GoogleSignInService _googleSignInService;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultGoogleSignInUseCase({
    GoogleSignInService? googleSignInService,
    SaveLocalStorageUseCase? saveLocalStorageUseCase,
    SaveUserDataUseCase? saveUserDataUseCase
  }) : _googleSignInService = googleSignInService ?? DefaultGoogleSignInService(),
        _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase(),
        _saveUserDataUseCase = saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<UserEntity, Failure>> execute() async {
    final user = await _googleSignInService.signInWithGoogle();
    //Mantener la sesion del usuario
    _saveLocalStorageUseCase.execute(saveLocalParameteres: SaveLocalStorageParameters(key: LocalStorageKeys.idToken,
        value: user.idToken ?? ""));


    final isUserInDatabase = await _googleSignInService.isUserInDatabase(uid: user.uid ?? "");
    if (isUserInDatabase) {
      return Result.success(mapUserEntity(user:user));
    } else {
      return _saveUserDataInDataBase(user: user);
    }
  }
}

extension on DefaultGoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> _saveUserDataInDataBase({ required GoogleSignInUserEntity user }) {

    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        localId: user.uid,
        role: UserRole.user,
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.idToken,
        provider: UserAuthProvider.google
    );

    return _saveUserDataUseCase.execute(params: _params);
  }

  UserEntity mapUserEntity({ required GoogleSignInUserEntity user }) {
    return UserEntity(
        localId: user.uid,
        role: UserRole.user.toShortString(),
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.refreshToken,
        provider: UserAuthProvider.google
    );
  }
}