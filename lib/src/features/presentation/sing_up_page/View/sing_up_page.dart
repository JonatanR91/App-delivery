import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
//import 'package:delivery/src/features/presentation/widgets/back_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
       elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return const BackButton( color: Colors.black);
        }),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
                  headerText(
                  texto: 'Create an account',
                  color: Colors.black38,
                  fontSize: 45.0),
              _usernameInput(context),
              _emailInput(context),
              _phonoInput(context),
              _dataOfBirthInput(context),
              _passwordInput(context),
              _signUpButton(context),
              Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 40.0),
                  child: const Text(
                      'By clicking Sign up you to the following Terms and',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0)))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _usernameInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Username',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _emailInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _phonoInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: 'phone',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _dataOfBirthInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          hintText: 'Data of Birth',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _signUpButton(BuildContext context) {
  return Container(
      width: 400.0,
      height: 47.0,
      margin: const EdgeInsets.only(top: 40.0),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: headerText(
                      texto: 'SignUp',
                      color: white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold))
            ],
          )));
}
