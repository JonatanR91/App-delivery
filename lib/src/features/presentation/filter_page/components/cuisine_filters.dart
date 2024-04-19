import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Buttons/rounded_button.dart';
class CuisinesFilter extends StatefulWidget {
  const CuisinesFilter({super.key});

  @override
  State<CuisinesFilter> createState() => _CuisinesFilterState();
}

class _CuisinesFilterState extends State<CuisinesFilter> {
  bool btnAmerican =false;
  bool btnSushi=false;
  bool btnAsia=false;

  bool btnPizza=false;
  bool btnDesserts=false;
  bool btnFastFood=false;
  bool btnVietnamese=false;

  

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
  
            _createButtonFilter(() {
              setState(() => btnAmerican = !btnAmerican);
            }, btnAmerican, 'American', context),
            _createButtonFilter(() {
              setState(() => btnAsia = !btnAsia);
            }, btnAsia, 'Asia', context),
            _createButtonFilter(() {
              setState(() => btnSushi = !btnSushi);
            }, btnSushi, 'Shushi', context)
           
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             _createButtonFilter(() {
              setState(() => btnPizza = !btnPizza);
            }, btnPizza, 'Pizza', context),
            _createButtonFilter(() {
              setState(() => btnDesserts = !btnDesserts);
            }, btnDesserts, 'Desserts', context),
            _createButtonFilter(() {
              setState(() => btnFastFood = !btnFastFood);
            }, btnFastFood, 'Fast Food', context),
            _createButtonFilter(() {
              setState(() => btnVietnamese = !btnVietnamese);
            }, btnVietnamese, 'Vietnam', context)
          ],
        )
    ],
    );
    
  }
}
Widget _createButtonFilter(
    Function()? func, 
    bool? isActive, 
    String? labelText,
    BuildContext context) {
  return Container(
    width: 120,
    height: 40,
    margin: const EdgeInsets.only(left: 5),
    child: createButton(
      context: context,
      labelButton: labelText ?? "",
      labelButtonColor: isActive ?? true ? orange : gris,
      func: func,
      buttonColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: isActive ?? true ? orange : gris)),
    ),
  );
}