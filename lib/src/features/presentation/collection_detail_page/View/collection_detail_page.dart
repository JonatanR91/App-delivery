import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Cards/favourites_car.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/backButtons/back_button.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
          
            expandedHeight: 230,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: NetworkImage('https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 1.3),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      width: double.infinity,
                      height: double.infinity),
                      Center(
                        child: headerText(
                          texto: 'asia \n Restaurant',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        textAlign: TextAlign.center),
                      )
                ],
              ),
            ),
            leading: Builder(
              builder:(BuildContext context) {
                return backButton(context, Colors.black);
              }),
              ),
               SliverList(
                   delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: headerText(
                        texto: '128 places',
                        color: const Color.fromRGBO(51, 58, 77, 1.0),
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  Column(
                    children: [
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
                    ],
                  )
                        ],
                      ),
                      )
                  ]
                  )
                  )
        ],
      ),
    );
  }
}