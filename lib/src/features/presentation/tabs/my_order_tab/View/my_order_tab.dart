import 'package:flutter/material.dart';
import 'package:yes_no_app/src/Colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Buttons/rounded_button.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/tabs/my_order_tab/View/components/empy_order_view.dart';

class MyorderTab extends StatefulWidget {
  const MyorderTab({super.key});

  @override
  State<MyorderTab> createState() => _MyorderTabState();
}

class _MyorderTabState extends State<MyorderTab> {
  final emtyOrderState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      body: emtyOrderState ? const EmptyOrderView() :CustomScrollView(
        slivers: [
          SliverAppBar(
             elevation: 0.5,
        leading: const Text(''),
        backgroundColor: white,
        title:  headerText(
          texto: 'My Order',
          color: greyColor,
          fontSize: 17,
          fontWeight: FontWeight.w600
        ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                   padding:const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                  _orders(context),
                  _checkoutResume(context)
                  ],
                ),)
              ]
            ))
        ],
      ) 
    );
  }
}
Widget _orders(BuildContext context){
  return Column(
    children: [
      _cardOrder(context)
    ],
  );
}
Widget _cardOrder(BuildContext context){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal:10.0),
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromRGBO(248, 248, 248, 1.0),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(210, 211, 215, 1.0),
          spreadRadius: 1.0,
          blurRadius: 4.0)
          ]),
          child: Column(
            children: [
              Row(
                children: [
                  _cardOrderTopContent(context)
                ],
              ),
              Column(
                children: [
                  _items(context),
                  _items(context),
                  _items(context),
                  _items(context)
                ],),
                _moreitemstext(context)
            ],
          ),
  );
}

Widget   _cardOrderTopContent( context){
  return Container(
    padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 7.0,bottom: 7.0,right: 20.0),
          child: headerText(
            texto: "Little Creature - Clud Street",
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        Row(
           mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.location_on,
            color: gris,
            size: 16.0),
            headerText(
              texto: '87 Botsford Circle Apt',
              color: gris,
              fontSize: 15.0,
              fontWeight: FontWeight.w400
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: 150.0,
                height: 50.0,
                child: createButton(
                    context: context,
                    buttonColor: orange,
                    labelButton: 'Free Delivery',
                    labelFontSize: 11.0,
                    func: () {
                      
                    },),
                     )
          ],)
        ],
    ),
  );
}
Widget _items( context){
return Container(
  decoration:  BoxDecoration(
    border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
  ),
  child: ListTile(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText(texto: 'Special Gajenanad Bhel',
        color: orange,
        fontWeight: FontWeight.w300,
        fontSize: 15.0),
         headerText(texto: 'Mixed vegetables, Chicken Egg',
        color: gris,
        fontWeight: FontWeight.w300,
        fontSize: 12.0)
      ],
    ),
    trailing: headerText(texto: '17.2',
        color: orange,
        fontWeight: FontWeight.w300,
        fontSize: 15.0),
  ),
);
}

Widget _moreitemstext(context){
return ListTile(
  title: headerText(texto: 'Add more items',
      color: pink,
      fontWeight: FontWeight.w600,
      fontSize: 17.0), 
);
}

Widget _checkoutResume(context){
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: white,
      boxShadow: const [
        BoxShadow(
          color:  Color.fromRGBO(210, 211, 215, 1.0),
          spreadRadius: 1.0,
          blurRadius: 4.0
        ),
      ]
    ),
    child:Column(
      children: [
        _itemsCheckOutResume(title: 'Subtotal',value:'93.40 €',context: context),
        _itemsCheckOutResume(title: 'tex & Fee',value:'3.00 €',context: context),
        _itemsCheckOutResume(title: 'Delivery',value:'Free',context: context),
        _buttonCheckout(context)
      ],
    ) ,
  );

}
Widget _itemsCheckOutResume({title=String, value=String, context=BuildContext}){
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Theme.of(context).dividerColor)) 
    ),
    child: ListTile(
      title: headerText(
        texto: title,
        
        fontWeight: FontWeight.w400,
        fontSize: 15.0),
        trailing:headerText(
        texto: value,
        
        fontWeight: FontWeight.w500,
        fontSize: 15.0), 

    )
  );
}

Widget _buttonCheckout(context){
     return Container(
    width: double.infinity,
    height: 45.0,
    margin: const EdgeInsets.only(top: 10.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.5, backgroundColor: orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            margin: const EdgeInsets.only(left: 50),
            child: headerText(
                texto: 'Pedir',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: white),
          ),
          Container(
            child: headerText(
                texto: '95.49 €',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: white),
          )
        ],
      ),
    ),
  );
}