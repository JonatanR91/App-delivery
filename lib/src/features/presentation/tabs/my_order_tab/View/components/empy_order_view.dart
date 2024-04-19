import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';

class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: white,
        title:  headerText(
          texto: 'My Order',
          color: primaryColor,
          fontSize: 17,
          fontWeight: FontWeight.w600
        ),
      ),
      body:
       Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
              const Image(
               width: 216,
               height: 216,
               image: AssetImage('assets/emptyOrder.png')),
               Container(
                 margin: const EdgeInsets.only(top:30),
                 child: headerText(
                   texto:'Cart Empty',
                   color: gris,
                   fontSize: 25,
                   fontWeight: FontWeight.bold),
               ),
                 Container(
                   margin: const EdgeInsets.only(top: 20.0),
                   padding: const EdgeInsets.symmetric(horizontal: 30),
                   child: headerText(texto:'Good food is always cooking! Go ahead, order some yummy items from the menu.',
                   textAlign: TextAlign.center,
                   color: gris,
                   fontSize: 17,
                   fontWeight: FontWeight.w500 ),
                 )
           ],
         ),
       ),
  
    );
  }
}