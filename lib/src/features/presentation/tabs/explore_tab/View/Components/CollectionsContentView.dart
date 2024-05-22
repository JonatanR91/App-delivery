
import 'package:yes_no_app/src/Base/Views/BaseView.dart';
import 'package:yes_no_app/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Carrousels/CollectionsCarrousel.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/HeaderView.dart';

class CollectionsContentView extends StatelessWidget with BaseView {

  // Dependencies
  List<CollectionDetailEntity> collections = [];

  CollectionsContentView({ Key? key,
    required this.collections }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return collections.isEmpty ?
    Container(height:20
    ) : Column(
      children: [
        GestureDetector(
            onTap: () {
              coordinator.showCollectionsPage(context: context, collections: collections);
            },
            child: HeaderView(textHeader:"Collections", textAction: "Show all")),
        CollectionsCarrousel(collections: collections)
      ],
    );
  }
}
