import 'package:flutter/material.dart';
//UI
import 'package:flutter/services.dart';
import 'package:yes_no_app/src/buttons/button.dart';
import 'package:yes_no_app/src/colors/colors.dart';
//import 'package:delivery/src/routes/widgets/back_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  get gris => null;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Image(
                  width: double.infinity,
                  height: 350.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixlib=eyJhcHBfaWQi0jEyMDd&fit=crop&w=500&q=60')),
              Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: const BackButton( color: Colors.white))
            ],
          ),
          Transform.translate(
            offset: const Offset(0.0, -20.0),
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Form(
                    //key: _viewModel.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Text("Welcome Back",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0)),
                        Text("Login to you account",
                            style: TextStyle(
                                color: gris,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0)),
                        _emailinnput(),
                        _passwordinnput(),
                        _buttonlogin(context),
                        Container(
                          margin: const EdgeInsets.only(top: 30.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'forgot-password');
                            },
                            child: const Text('Forgot you password?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            children: [
                              const Text("Don't have an account?",
                                  style: TextStyle(
                                      color: Colors.black ,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0)),
                              GestureDetector(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'sing-up');
                                  },
                                  child: Container(
                        
                                    margin: const EdgeInsets.only(top: 40.0),
                                    child: const Text('Sign up',
                                        style: TextStyle(
                                            color: black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _emailinnput() {
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

Widget _passwordinnput() {
  return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(142, 142, 147, 1.2),
          borderRadius: BorderRadius.circular(30.0)),
      child: const TextField(
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(borderSide: BorderSide.none))));
}

Widget _buttonlogin(BuildContext context) {
 return createElevatedButton(
                labelButton: 'Tabs',
                labelColor: black,
                color: orange,
                shape: const StadiumBorder(),
                func: () {
                  Navigator.pushNamed(context, 'tabs');
                });
 
 
}
