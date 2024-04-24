
import 'package:flutter/cupertino.dart';
import 'package:yes_no_app/src/Base/ApiService/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/LocasStorageKeys.dart';
import 'package:yes_no_app/src/Base/Views/BaseView.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:yes_no_app/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpuseCaseParameters.dart';
import 'package:yes_no_app/src/features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:yes_no_app/src/features/domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/TextFormFields/CustomtextFormField.dart';
import 'package:yes_no_app/src/features/presentation/Stateprovider/LoadingStateProvider.dart';
import 'package:yes_no_app/src/features/presentation/sing_up_page/Model/SignUpModel.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

abstract class SignUpViewModelInput {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late DateTime selectedDate;
  SignUpModel? signUpModel = SignUpModel();
  Future<Result<bool,Failure>> signUp();
  bool isFormValidate();
}

abstract class SignUpViewModel extends SignUpViewModelInput with TextFormFieldDelegate, BaseViewModel {}

class DefaultSignUpViewModel extends SignUpViewModel {

  // Dependencias
  final SignUpUseCase _signUpUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSignUpViewModel({  SignUpUseCase? signUpUseCase,
    SaveLocalStorageUseCase? saveLocalStorageUseCase })
      : _signUpUseCase = signUpUseCase ?? DefaultSignUpUseCase(),
        _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({ required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> signUp() {
    loadingState.setLoadingState(isLoading: true);

    return _signUpUseCase.execute(params: SignUpUseCaseParameters(username: signUpModel?.username ?? "",
        email: signUpModel?.email ?? "",
        password: signUpModel?.password ?? "",
        phone: signUpModel?.phone ?? "",
        date: signUpModel?.date))
        .then( (result) {
      switch (result.status) {
        case ResultStatus.success:
          _saveLocalStorageUseCase.execute(parameters: SaveLocalStorageParameters(key: LocalStorageKeys.idToken,
              value: result.value?.idToken ?? ""));
          loadingState.setLoadingState(isLoading: false);
          return Result.success(true);
        case ResultStatus.error:
          loadingState.setLoadingState(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }

  @override
  onChanged({ required String newValue,
    required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        signUpModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        signUpModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        signUpModel?.username = newValue;
        break;
      case CustomTextFormFieldType.phone:
        signUpModel?.phone = newValue;
        break;
      case CustomTextFormFieldType.dateOfBirth:
        signUpModel?.date = newValue;
        break;
    }
  }
}