import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Buttons/rounded_button.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));

    return Scaffold(
        body:
        Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
          )),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: headerText(
                  texto: 'DELIVERED FAST FOOD\nTO YOUR\nDOOR',
                  color: Colors.white,
                  fontSize: 45.0),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: const Text(
                  'Set exact location to find the right restaurants near you.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0)),
            ),
            createButton(
                context: context,
                labelButton: 'Log in',
                buttonColor: orange,
                func: () {
                  Navigator.pushNamed(context, 'login');
                }),
             createButton(
                context: context,
                labelButton: 'Connect with facebook',
                buttonColor: fbButtonColor,
                isWithIcon: true,
                icon:const AssetImage('assets/facebook.png'),
                func: () {} //print("goToFacebook")
                )
          ],
        )
      ],
    ));
  }
}
