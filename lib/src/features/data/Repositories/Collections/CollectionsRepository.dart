
import 'package:yes_no_app/src/features/data/Decodables/CollectiosDecodable/CollectionsDecodable.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/Services/RealtimeDataBaseService.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/interfaces.dart';

abstract class CollectionsRepository {
  Future<CollectionsDecodable> fetchCollections();
}

class DefaultCollectionsRepository extends CollectionsRepository {

  String _path = "collections/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultCollectionsRepository({ RealtimeDataBaseService? realtimeDataBaseService })
      : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<CollectionsDecodable> fetchCollections() async {
    final response = await _realtimeDataBaseService.getData(path: _path);
    CollectionsDecodable decodable = CollectionsDecodable.fromMap(response);
    return decodable;
  }
}
