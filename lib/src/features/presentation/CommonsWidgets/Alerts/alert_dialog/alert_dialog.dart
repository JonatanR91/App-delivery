import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';

Future showAlertDialog(
BuildContext context, 
ImageProvider<Object> imagePath,
 String headerTitle, 
 String headerSubTitle, 
 Widget doneButton) async {
 await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SizedBox(
            height: 400,
            child: Column(
              children: [
               Image(
                image: imagePath,
                width: 130,
                height: 130,
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
            
                   child: headerText(
                  texto: headerTitle,
                  color: Colors.black,
                  fontSize: 40.0),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: Text( headerSubTitle
                    ,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
             doneButton
            ]),
          ),
        );
      });
}
