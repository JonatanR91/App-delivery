import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Buttons/rounded_button.dart';

Widget popularesCard(
    {required BuildContext context,
    double marginTop = 0.0,
    double marginRight = 0.0,
    double marginBottom = 0.0,
    double marginLeft = 10.0,
    required ImageProvider<Object> image,
    required String title,
    required String subtitle,
    required String review,
    required String ratings,
    String buttonText = '',
    required bool hasActionButton}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
            top: marginTop,
            right: marginRight,
            bottom: marginBottom,
            left: marginLeft),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                  width: 80.0, height: 80.0, fit: BoxFit.cover, image: image),
            ),
            Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Text(title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0)),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: Text(subtitle,
                          style: const TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0)),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: yellow, size: 16.0),
                        Text(review,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0)),
                        Text(ratings,
                            style: const TextStyle(
                                color: greyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0)),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          width: 110.0,
                          height: 18.0,
                          child: hasActionButton
                              ? createButton(
                                  context: context,
                                  buttonColor: orange,
                                  labelButton: buttonText,
                                  labelFontSize: 11.0)
                              : const Text(''),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      )
    ],
  );
}
