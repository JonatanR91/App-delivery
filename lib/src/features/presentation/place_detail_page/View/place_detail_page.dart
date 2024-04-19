import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_double/header_double.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/backButtons/back_button.dart';

import '../../CommonsWidgets/Buttons/rounded_button.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          label: headerText(
              texto: 'Añadir a la Cesta  95.40 €',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17)),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: orange,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')),
                  Container(
                      decoration:
                          const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 1.5)),
                      width: double.infinity,
                      height: 350),
                  Wrap(
                    children: [
                      _promoButton(context),
                      _infoPlace(),
                      _infoPlaceStats(),
                       _offerBanner(context)
                    ],
                  )
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.white);
            }),
            actions: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Image(
                    width: 28,
                    height: 28,
                    image:  AssetImage('assets/share.png')),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {})
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _headers(texto: 'Populars'),
            _sliderCards(),
            _headers(texto: 'Full Menu'),
            _menuList(context),
            _headers(texto: 'Reviews'),
            _reviews(),
            _headers(texto: 'Your Rating'),
            _yourRating(),
            const SizedBox(height: 150.0),
          ]))
        ],
      ),
    );
  }
}

Widget _promoButton(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 121.0, left: 30.0, right: 15.0),
    width: double.infinity,
    height: 50,
    child: Row(
      children: [
        createButton(
            width: 150,
            context: context,
            labelButton: 'Free delivery',
            buttonColor: orange,
            func: () {
              //Navigator.pushNamed(context, 'login');
            }),
      ],
    ),
  );
}

Widget _infoPlace() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        child: headerText(
            texto: "Boon Lay Ho Huat Fried Prawn Noodle",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: gris),
            headerText(
                texto: "03 Jameson Manors Apt. 177",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ],
        ),
      )
    ],
  );
}

Widget _infoPlaceStats() {
  return Container(
    margin: const EdgeInsets.only(top: 26.0),
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    height: 70.0,
    decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.white),
            bottom: BorderSide(color: Colors.white))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.star,
                color: Colors.white,
                size: 19.0,
              ),
              headerText(
                  texto: '4.5',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            headerText(
                texto: "351 Ratings",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 19.0,
              ),
              headerText(
                  texto: '137k',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            headerText(
                texto: "Favourites",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.photo,
                color: Colors.white,
                size: 19.0,
              ),
              headerText(
                  texto: '345',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            headerText(
                texto: "Photos",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        )
      ],
    ),
  );
}

 Widget _offerBanner(BuildContext context) {
   return Container(
    
     color: const Color.fromRGBO(255, 237, 214, 1.0),
     padding: const EdgeInsets.all(20),
     height: 90.0,
     child: Row(
       children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             headerText(
                 texto: 'New! Try Pickup',
                 color: orange,
                 fontWeight: FontWeight.bold,
                 fontSize: 15.0),
             headerText(
                 texto:
                     'Pickup on your time. Your order is \n ready when you are.',
                 color: orange,
                 fontWeight: FontWeight.w400,
                 fontSize: 13.0)
           ],
         ),
         const Spacer(),
         createButton(
             context: context,
             labelButton: 'Order Now',
             labelFontSize: 13.0,
             shape:
                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
             buttonColor: orange)
       ],
     ),
   );
 }

Widget _headers({texto = String}) {
  return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: headerDoubleText(textHeader: texto, textAction: ''));
}

Widget _sliderCards(){
  return Container(
    height: 210.0,
    padding: const EdgeInsets.only(left: 10),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext  context, int index){
        return _cards();
      })
  );
}
Widget _cards(){
 return Container(
    margin: const EdgeInsets.all(0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: const Image(
            width: 200.0,
            height: 100.0,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')),
      ),
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: headerText(
            texto: "Peanut Chaat with Dahi",
            fontWeight: FontWeight.bold,
            fontSize: 15.0),
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: headerText(
            texto: "9.50 €",
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: gris),
      ),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: headerText(
                texto: "Selecciona",
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
                color: orange),
          ),
 //Revisar imagel
          /*Container(
            margin: const EdgeInsets.only(top: 10, left: 90),
            child: const Image(
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                image:  AssetImage('assets/plus_order.png')),
          )*/
        ],
      )
    ]),
  );
}
Widget _menuList(BuildContext context){
  return Container(
    padding: const EdgeInsets.only(left: 10.0) ,
    child: Column(
      children: [
       _menuItem(context, 'Salads','2'),
       _menuItem(context, 'Chicken','5'),
       _menuItem(context, 'soups','6'),
       _menuItem(context, 'Vegetables','7')
      ],
    ),
  );
}

Widget _menuItem(BuildContext context, String texto,String itemCount){

return Container(
decoration: const BoxDecoration(
  border: Border(
    bottom: BorderSide(color: gris)
  )
),
child: Column(
  children: [
    ListTile(
      title: headerText(
        texto: texto,fontWeight: FontWeight.w300,fontSize: 17.0
      ),
      trailing: headerText(
        texto: texto,fontWeight: FontWeight.w300,fontSize: 17.0
      ),
    ),
    _sliderCards()
  ],
),
);
}

Widget _reviews(){
  return Container(
    height: 135,
    padding: const EdgeInsets.only(left: 10),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context,int index) {
        return _cardReviews();
      }
      )
      
  );
}

Widget _cardReviews() {
  var lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";

  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    width: 350,
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: const Image(
                  width: 49.0,
                  height: 43.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1614746713986-0afbec40881f?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerText(
                      texto: 'Mike Smithson',
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  headerText(
                      texto: '45 Reviews',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: gris)
                ],
              ),
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 30,
                color: orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headerText(
                        texto: '4',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    const Icon(Icons.star, color: Colors.white, size: 14)
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: headerText(
              texto: lorem,
              color: gris,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left),
        ),
        Container(
         margin: const EdgeInsets.only(top: 10),
          child: headerText(
              texto: 'See full review',
              color: orange,
              fontSize: 8,
              fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

Widget _yourRating(){
   var lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";
return Container(
margin: const EdgeInsets.only(top: 10),
padding: const EdgeInsets.only(left: 10,right: 10),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Row(
 mainAxisAlignment: MainAxisAlignment.spaceAround,   
  children: [
     ClipRRect(
       borderRadius: BorderRadius.circular(8),
       child: Container(
         width: 60,
         height: 30,
         color: orange,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             headerText(
                 texto: '1',
                 color: orangeWithHalfOpacity,
                 fontWeight: FontWeight.w400,
                 fontSize: 12),
             const Icon(Icons.star, color: Colors.white, size: 14)
           ],
         ),
       ),
     ),
               ClipRRect(
                 borderRadius: BorderRadius.circular(8),
                 child: Container(
                   width: 60,
                   height: 30,
                   color: orange,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       headerText(
                           texto: '2',
                           color: orangeWithHalfOpacity,
                           fontWeight: FontWeight.w400,
                           fontSize: 12),
                       const Icon(Icons.star, color: Colors.white, size: 14)
                     ],
                   ),
                 ),
               ),
               ClipRRect(
                 borderRadius: BorderRadius.circular(8),
                 child: Container(
                   width: 60,
                   height: 30,
                   color: orange,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       headerText(
                           texto: '3',
                           color: orangeWithHalfOpacity,
                           fontWeight: FontWeight.w400,
                           fontSize: 12),
                       const Icon(Icons.star, color: Colors.white, size: 14)
                     ],
                   ),
                 ),
               ),
               ClipRRect(
                 borderRadius: BorderRadius.circular(8),
                 child: Container(
                   width: 60,
                   height: 30,
                   color: orange,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       headerText(
                           texto: '4',
                           color: orange,
                           fontWeight: FontWeight.w400,
                           fontSize: 12),
                       const Icon(Icons.star, color: Colors.white, size: 14)
                     ],
                   ),
                 ),
               ),
               ClipRRect(
                 borderRadius: BorderRadius.circular(8),
                 child: Container(
                   width: 60,
                   height: 30,
                   color: orange,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       headerText(
                           texto: '5',
                           color: orangeWithHalfOpacity,
                           fontWeight: FontWeight.w400,
                           fontSize: 12),
                       const Icon(Icons.star, color: Colors.white, size: 14)
                     ],
                   ),
                 ),
               )

  ],
  ),
  Container(
    margin: const EdgeInsets.only(top: 10,left: 20),
    child: headerText(
      texto: lorem,
      color: gris,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      textAlign: TextAlign.left),
  ),
    Container(
    margin: const EdgeInsets.only(top: 10,left: 20),
    child: headerText(
      texto: "+ Edit your review",
      color: orange,
      fontSize: 15,
      fontWeight: FontWeight.w500),
  ),
    ],
    ),
  );
}