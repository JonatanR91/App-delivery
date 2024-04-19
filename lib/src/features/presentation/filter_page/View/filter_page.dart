import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/filter_page/components/cuisine_filters.dart';
import 'package:yes_no_app/src/features/presentation/filter_page/components/list_tile_checked.dart';
import 'package:yes_no_app/src/features/presentation/filter_page/components/price_filter.dart';
class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // SORT BY BOOL
  bool topRated = false;
  bool nearMe = false;
  bool costHighToLow = false;
  bool costLowtoHigh = false;
  bool mostPopular = false;

 // FILTER BOOL
  bool openNow = false;
  bool creaditCards = false;
  bool alcoholSarved = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: _appBar(context),
     body:  CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
              child: headerText(
                  texto: 'CUISINES',
                  color: greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: const CuisinesFilter()),
           
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15.0),
              child: headerText(
                  texto: 'SORT BY',
                  color: greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            
            _sortByContainer(),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15.0),
              child: headerText(
                  texto: 'FILTER',
                  color: greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            _filterContainer(),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15.0),
              child: headerText(
                  texto: 'PRICE',
                  color: greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            const PrinceFilter(),
          ]))
        ],
      ),
    );
  }
  Widget _sortByContainer(){
     return Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   Column(
                  children: [
                    ListTileCheck(
                      texto: 'Top Rated',
                      isActive: topRated,
                      func: () {
                        setState(() => topRated = ! topRated);
                      },),
                       
                       ListTileCheck(
                      texto: 'Nearest Me',
                      isActive: nearMe,
                      func: () {
                        setState(() => nearMe = ! nearMe);
                      },),
                     
                      ListTileCheck(
                      texto: 'cost Low to High',
                      isActive: costLowtoHigh,
                      func: () {
                        setState(() => costLowtoHigh = !costLowtoHigh);
                      },),
                       ListTileCheck(
                      texto: 'Most Popular',
                      isActive: mostPopular,
                      func: () {
                        setState(() => mostPopular = !mostPopular);
                      },),
                  ],
                )
                );
  }
  Widget _filterContainer(){
    return Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   Column(
                  children: [
                     ListTileCheck(
                      texto: 'Open Now',
                      isActive: openNow,
                      func: () {
                        setState(() => openNow = !openNow);
                      },),
                    ListTileCheck(
                      texto: 'Creadits Cards',
                      isActive: creaditCards,
                      func: () {
                        setState(() => creaditCards = ! creaditCards);
                      },),
                       
                       ListTileCheck(
                      texto: 'Alcohol Served',
                      isActive: alcoholSarved,
                      func: () {
                        setState(() => alcoholSarved = ! alcoholSarved);
                      },),
                       
                  ],
                )
                );
  }
}
PreferredSizeWidget? _appBar(BuildContext context) {
  return AppBar(
    elevation: 0.5,
    backgroundColor: Colors.white,
    title: headerText(texto: 'Filters', fontWeight: FontWeight.w600),
    leading: Container(
        padding: const EdgeInsets.only(top: 20, left: 7.0),
        child: headerText(
            texto: 'Reset',
             fontWeight: FontWeight.w500, 
             fontSize: 17.0)),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: const EdgeInsets.only(top: 20, right: 10.0),
            child: headerText(
                texto: 'Done',
                color: orange,
                fontWeight: FontWeight.w500,
                fontSize: 17.0)),
      )
    ],
  );
}