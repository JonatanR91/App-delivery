import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Cards/VerticalCards/RecentSearchVerticalCardView/RecentSearchVerticalCardView.dart';


class RecentSearchCarrouselView extends StatelessWidget {
  // Dependencies
  final List<PlaceDetailEntity> placeList;
  RecentSearchCarrouselView({ Key? key, required this.placeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5.0),
        height: 240.0,
        child: ListView.builder(
          itemCount: placeList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return RecentSearchVerticalCardView(placeListDetailEntity: placeList[index]);
          },
        ));
  }
}
