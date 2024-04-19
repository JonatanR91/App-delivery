import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';

class DefaultFetchLocalStorageRepository extends FetchLocalStorageRepository {

  // * Dependencies
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<String?> fetchInLocalStorage({ required String key}) async {

    final SharedPreferences prefs = await _prefs;
     return prefs.getString(key);
  }
}