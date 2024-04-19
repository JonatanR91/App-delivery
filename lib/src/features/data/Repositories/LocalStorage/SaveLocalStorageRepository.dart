
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';

class DefaultSaveLocalStorageRepository extends SaveLocalStorageRepository {

  // * Dependencies
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> saveInLocalStorage({ required String key,
    required String value }) async {

    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }
}