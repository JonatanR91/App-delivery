import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yes_no_app/src/buttons/button.dart';
import 'package:yes_no_app/src/colors/colors.dart';

class ErrorAlertView {
  static Future showErrorAlertDialog({
    required BuildContext context,
    required String subTitle,
    dynamic Function()? ctaButtonAction }) async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SizedBox(
              height: 320,
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/errorIcon.png'),
                    width: 130,
                    height: 130,
                  ),
                 /* Container(
                      margin: const EdgeInsets.all(15.0),
                      child: TextView(
                          texto: "Network error",
                          color: accentColor,
                          fontSize: 20.0)),*/
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(subTitle,
                        style: TextStyle(
                            color: accentColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0)),
                  ),
                  createElevatedButton(
                      color: orange,
                      labelButton: 'Ir a Inicio',
                      shape: const StadiumBorder(),
                      func: ctaButtonAction
                  )
                ],
              ),
            ),
          );
        });
  }
}

