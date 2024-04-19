import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/Auth/UpdatePassword/UpdatePasswordRepository.dart';

abstract class UpdatePasswordUseCase {
 Future<void> execute({required String email});

}

class DefaultUpdatePasswordUseCase extends UpdatePasswordUseCase{
  //dependencias

  UpdatePasswordRepository _updatePasswordRepository;

  DefaultUpdatePasswordUseCase(UpdatePasswordRepository? updatePasswordRepository)
          : _updatePasswordRepository = updatePasswordRepository ?? DefaultUpdatePasswordRepository();


  @override
  Future<void> execute({required String email}) {
   return _updatePasswordRepository.updatePassword(email: email);
  }

}