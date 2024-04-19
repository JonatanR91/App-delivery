import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';

class DefaultRemoveLocalStorageRepository extends RemoveLocalStorageRepository {

  // * Dependencies
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> removeInLocalStorage({ required String key}) async {

    final SharedPreferences prefs = await _prefs;
     prefs.remove(key);
  }
}