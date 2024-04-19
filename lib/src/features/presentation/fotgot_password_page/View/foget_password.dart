import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Alerts/alert_dialog/alert_dialog.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Buttons/rounded_button.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return const BackButton( color: Colors.black);
        }
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
                 headerText(
                  texto: 'Forgot password',
                  color: Colors.white,
                  fontSize: 45.0),
                    
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                  'Please enter your email you will receive a link to create a new password via email.',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0)),
            ),
            _emailinput(),
            _sendButton(context),
          ]),
        ),
      ),
    );
  }
}

Widget _emailinput() {
  return Container(
      margin: const EdgeInsets.only(top: 40.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(142, 142, 147, 1.2),
          borderRadius: BorderRadius.circular(30.0)),
      child: const TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(borderSide: BorderSide.none))));
}

Widget _sendButton(BuildContext context) {
  return Container(
      width: 370.0,
      height: 45.0,
      margin: const EdgeInsets.only(top: 40.0),
      child: ElevatedButton(
          onPressed: () {
            _showAlerta(context);
          },
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
                      texto: 'Send',
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold))
            ],
          )));
}

void _showAlerta(BuildContext context) {
 showAlertDialog(context, const AssetImage('assets/lock.png'), 
 'Your password has been reset',
 "You'll shortly receive an email with a code to sutup a new password. ",
     createButton(
             context: context,
              labelButton: 'Done',
              buttonColor: orange,
              func: () {
                Navigator.pushNamed(context, 'login');
              }));
}



