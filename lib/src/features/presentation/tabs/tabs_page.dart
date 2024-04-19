import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Alerts/alert_dialog/alert_dialog.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/tabs/explore_tab/View/explore_tab.dart';
import 'package:yes_no_app/src/features/presentation/tabs/my_order_tab/View/my_order_tab.dart';
import 'package:yes_no_app/src/features/presentation/tabs/favourite_tab/View/favourite_tab.dart';
import 'package:yes_no_app/src/features/presentation/tabs/profile_tab/View/profile_tab.dart';

class TabsPage extends StatefulWidget {
   const TabsPage({super.key});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  //tiempo de espera para llamar a la alert de la funcion
  void initState() {
    super.initState();
  Future.delayed(Duration.zero,(){
    _pedirLocation(context);
  });
  }

   final List<Widget> _widgetOptions = [
    const ExploreTab(), 
    const MyorderTab(),
    const FavoiriteTab(),
   const ProfileTab()
    ];
    int _selecteditemIndex = 0;
  void _cambiarWidget(int index){
    setState(() {
      _selecteditemIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _widgetOptions.elementAt(_selecteditemIndex),
      bottomNavigationBar: _bottomNavigationBar(context), 
    );
  }


Widget _bottomNavigationBar(BuildContext context){
  return BottomNavigationBar(
    iconSize: 30.0,
    selectedItemColor: Theme.of(context).colorScheme.secondary,
    unselectedItemColor: const Color.fromRGBO(172, 145, 65, 1),
    currentIndex: _selecteditemIndex,
    onTap: _cambiarWidget,
    showSelectedLabels: true,
    items:const <BottomNavigationBarItem> [ 
    BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      label: 'Explore'
    ),
      BottomNavigationBarItem(
      icon: Icon(Icons.assignment),
      label: 'My Order'
    ),
      BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Favourites'
    ),
      BottomNavigationBarItem(
      icon: Icon(Icons.person_pin),
      label: 'Profile'
    )
  ] 
  );
}
  
}
Future _pedirLocation(BuildContext context)async{
 await showAlertDialog(
  context, const AssetImage('assets/location.png'),
  'Enable you Location',
  "Please allow to use your location to show neardy restaurant on the map.",
  _doneButton(context, "Enable Location")
  );
}

Widget _doneButton(BuildContext context, String labelButton) {
  return Container(
      width: 370.0,
      height: 45.0,
      margin: const EdgeInsets.only(top: 40.0),
      child: ElevatedButton(
          onPressed: (){
            //print("Habilitar geolocation" );
          },  
          
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: headerText(
                      texto: labelButton,
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold))
            ],
          )));
}
