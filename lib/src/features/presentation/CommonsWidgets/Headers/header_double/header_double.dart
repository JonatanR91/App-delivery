import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';

Widget headerDoubleText( {
    required String textHeader,
    required String textAction,
    Function()? func}){
  return Row(
    children: [
      headerText(
        texto: textHeader,
        fontSize: 20.0
      ),
      const Spacer(),
      GestureDetector(
        onTap: func,
        child: headerText(texto: textAction, 
        color: orange,
        fontWeight: FontWeight.w500,
        fontSize: 15.0),
      )
            ],
  );
}