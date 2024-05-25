import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';


class LoadingView extends StatelessWidget {
  const LoadingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: orange,
            ),
            SizedBox(height: 10),
            Text('Loading...')
          ],
        ),
      ),
    );
  }
}