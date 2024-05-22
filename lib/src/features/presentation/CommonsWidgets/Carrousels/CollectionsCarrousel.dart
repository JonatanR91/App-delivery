import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Cards/CollectionsCard/CollectionsCardView.dart';


class CollectionsCarrousel extends StatelessWidget {

  // Dependencies
  List<CollectionDetailEntity> collections;
  CollectionsCarrousel({ Key? key,
    required this.collections }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180.0,
        child: ListView.builder(
            itemCount: collections.length < 5 ? collections.length : 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return CollectionCardView(collection: collections[index]);
            }));
  }
}
