
import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Cards/VerticalCards/NoveltyPlacesVerticalCardView/NoveltyPlacesVerticalCardView.dart';

class VerticalCardCarrousel extends StatelessWidget {

  final List<PlaceDetailEntity> placeList;

  const VerticalCardCarrousel({ Key? key, required this.placeList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 360.0,
        child: ListView.builder(
            itemCount: placeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return NoveltyPlacesVerticalCardView(placeListDetailEntity: placeList[index]);
            }));
  }
}




