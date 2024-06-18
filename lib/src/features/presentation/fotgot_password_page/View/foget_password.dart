import 'package:flutter/material.dart';
import 'package:yes_no_app/src/Colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/backButtons/back_button.dart';
import 'package:yes_no_app/src/features/presentation/fotgot_password_page/View/Components/TextFormFieldForgotEmail.dart';
import 'package:yes_no_app/src/features/presentation/fotgot_password_page/ViewModel/ForgetPasswordViewModel.dart';


class ForgotPassword extends StatefulWidget {

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  // Dependencies
  final ForgotPasswordViewModel viewModel;

  _ForgotPasswordState({ ForgotPasswordViewModel? forgotPasswordViewModel })
      : viewModel = forgotPasswordViewModel ?? DefaultForgotPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              headerText(
                  texto: 'Forgot password',
                  color: black ,
                  fontSize: 30.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    'Please enter your email address. You will receive a link to create a new password via email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
              TextFormFieldEmailUpdatePassword(viewModel: viewModel),
              /*createButton(
                  context: context,
                  buttonColor: orange,
                  labelButton: 'Send',
                  shape: const StadiumBorder(),
                  func: () => _ctaButtonTapped(context))*/
            ],
          ),
        ),
      ),
    );
  }
}

/*
extension UserActions on _ForgotPasswordState {
  void _ctaButtonTapped(BuildContext context) {
    viewModel.updatePassword().then( (value) {
      showAlertDialog(
          context,
          const AssetImage('assets/lock.png'),
          'Your password has been reset',
          "You'll shortly receive an email with a code to setup a new password.",
          createButton(
              context: context,
              labelButton: 'Done',
              buttonColor: orange,
              func: () {
                Navigator.pushNamed(context, 'login');
              }));
    });
  }
}*/

