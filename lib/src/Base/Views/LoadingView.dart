import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              backgroundColor:  orange,
            ),
            SizedBox(height: 10),
              Text('Loading...')
          ],
        ),
      ),
    );
  }
}
