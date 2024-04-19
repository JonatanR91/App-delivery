import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Cards/favourites_car.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
class FavoiriteTab extends StatefulWidget {
  const FavoiriteTab({super.key});

  @override
  State<FavoiriteTab> createState() => _FavoiriteTabState();
}

class _FavoiriteTabState extends State<FavoiriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const Text(''),
          backgroundColor: white,
          title: headerText(
            texto: 'My favourites',
            color: primaryColor,
            fontSize: 17,
            fontWeight: FontWeight.w600),
 ),
 SliverList(delegate:SliverChildListDelegate(
  [
    Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column( 
      children:[
         favouritesCard(
        
                    context: context,
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "87 Botsford Circle Apt",
                    review: "4.8",
                    ratings: "(233 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true,
                    isFavourite: true),

                    favouritesCard(
                    context: context,
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "87 Botsford Circle Apt",
                    review: "4.8",
                    ratings: "(233 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true,
                    isFavourite: true)
      ]
      
                   
    ),
    )
  ]
 ))
      ],
    ),
      
    );
  }
}