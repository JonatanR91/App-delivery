
import 'package:yes_no_app/src/features/domain/Entities/Collections/CollectionsEntity.dart';

import '../../../data/Repositories/Collections/CollectionsRepository.dart';

abstract class FetchCollectionUseCase {
  Future<CollectionsEntity> execute();
}

class DefaultFetchCollectionUseCase extends FetchCollectionUseCase {

  // * Dependencies
  final CollectionsRepository _collectionsRepository;

  DefaultFetchCollectionUseCase({ CollectionsRepository? collectionsRepository })
      : _collectionsRepository = collectionsRepository ?? DefaultCollectionsRepository();

  @override
  Future<CollectionsEntity> execute() async {
    final response = await _collectionsRepository.fetchCollections();
    return CollectionsEntity.fromMap(response.toMap());
  }
}
