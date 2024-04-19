import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Cards/populares_card.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Buttons/rounded_button.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});
  @override
   Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildListDelegate([
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _topBar(context),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    alignment: Alignment.centerLeft,
                    child: headerText(
                        texto: 'Discover new places',
                        color: Colors.black,
                        fontSize: 30.0)),
                _sliderCards(),
                _headers(context, "Popular this week", "Show all"),
                popularesCard(
                    context: context,
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "87 Botsford Circle Apt",
                    review: "4.8",
                    ratings: "(233 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true),
                popularesCard(
                    context: context,
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "87 Botsford Circle Apt",
                    review: "4.8",
                    ratings: "(233 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true),
                popularesCard(
                    context: context,
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                    title: "Andy & Cindy's Diner",
                    subtitle: "87 Botsford Circle Apt",
                    review: "4.8",
                    ratings: "(233 ratings)",
                    buttonText: 'Delivery',
                    hasActionButton: true),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'collections');
                    },
                    child: _headers(context, "Collections", "Show all")),
                _sliderCollections()
              ],
            ))
      ]))
    ]));
  }
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'search'),
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(234, 236, 239, 1.0)),
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                size: 20.0,
                color: gris,
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: const Text('Search',
                    style: TextStyle(color: gris, fontSize: 17.0)),
              )
            ],
          ),
        ),
      ),
      Container(
        width: 45.0,
        height: 45.0,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 209, 214, 1.0),
            borderRadius: BorderRadius.circular(30)),
        child: IconButton(
            icon: const Icon(
              Icons.filter_list,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'filter');
            }),
      )
    ],
  );
}


Widget _sliderCards() {

    return SizedBox(
        height: 350.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _tarjeta(context);
            }));
}

Widget _tarjeta(BuildContext context) {
 return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'place-detail');
    },
    child: Container(
      margin: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(
                width: 210.0,
                height: 250.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfDF8MHw%3D&auto=format&fit=crop&w=500&q=60')),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text("Andy & Cindy's Diner",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text("87 Botsford Circle Apt",
                    style: TextStyle(
                        color: gris,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: yellow, size: 16),
                  const Text("4.8",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  const Text("(233 ratings)",
                      style: TextStyle(
                          color: gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 80.0,
                      height: 18.0,
                      child: createButton(
                          context: context,
                          buttonColor: orange,
                          labelButton: 'Delivery',
                          labelFontSize: 11.0))
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}


Widget _headers(BuildContext context, String textHeader, String textAction) {
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: headerText(texto: textHeader, fontSize: 20.0),
      ),
      const Spacer(),
      GestureDetector(
        child: Row(
          children: [
            Text(
              textAction,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ),
            const Icon(Icons.play_arrow)
          ],
        ),
      ),
    ],
  );
}

Widget _sliderCollections() {
  return SizedBox(
      height: 180.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _tarjetaCollection(context);
          }));
}
Widget _tarjetaCollection(BuildContext context) {
   return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const Image(
            width: 300,
            height: 150,
            fit: BoxFit.cover,
            image:  NetworkImage(
                'https://images.unsplash.com/photo-1581546104493-f7e013a136ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
          ),
        ),
      ],
    ),
  );
}
