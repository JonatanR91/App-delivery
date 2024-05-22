import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Carrousels/PlaceListCarrousel.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/HeaderView.dart';

import '../../../../../../Base/Views/BaseView.dart';

class PopularPlacesContentView extends StatelessWidget with BaseView {

  List<PlaceDetailEntity> popularPlaces = [];
  PopularPlacesContentView({ Key? key, required this.popularPlaces }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return popularPlaces.isEmpty ?
    Container(
        height: 20
    ) :
    Column(
      children: [
       GestureDetector(
            onTap: () =>
                coordinator.showPlaceListPage(context: context,
                popularPlaces: popularPlaces),
            child: HeaderView(textHeader:"Popular this week",
                textAction: "Show all")),
        const SizedBox(
          height: 15.0,
        ),
        PlaceListCarrousel(placeList: popularPlaces,
            isShortedVisualization: true,
            carrouselStyle: PlaceListCarrouselStyle.list)
      ],
    );
  }
}