import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
//Commons Widgets
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';

Widget cardVertical(
    {required BuildContext context,
    required double width,
    required double height,
    required ImageProvider<Object> image,
    required String title,
    required String subtitle}) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
              width: width, height: height, fit: BoxFit.cover, image: image),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: headerText(
                  texto: title, fontWeight: FontWeight.w500, fontSize: 17.0),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: headerText(
                  texto: subtitle,
                  color: greyColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0),
            )
          ],
        )
      ],
    ),
  );
}
