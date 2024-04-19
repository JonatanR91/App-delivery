import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'profile-detail'),
            child: _header()),
          _contentProfile(context)
        ],
      ),
    );
    
  }
}
Widget _header(){
  return Container(
    height: 250,
    color: bgGreyPage,
    padding:  const EdgeInsets.all(50),
    child:  Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
            radius: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: Row(  
                children: [
                  headerText(
                    texto: 'David Jonatan',
                fontSize: 20,
                fontWeight: FontWeight.w600),
                IconButton(
                 icon:const Icon(Icons.chevron_right,color: gris),
                onPressed:() {}
                )
                ],
              ),
            ),
             Container(
                height: 25,
                margin: const EdgeInsets.only(left: 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pink,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                        ),
                  ),
                  child: Row(
                    children: [
                      const Image(
                          image: AssetImage('assets/crown.png'),
                          width: 16,
                          height: 16),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: headerText(
                            texto: 'VIP Member', color: white, fontSize: 11),
                      )
                    ],
                  ),
                ),
              )
          ],
        )
      ],
    ),

  );
}
Widget _contentProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: const Image(
              image: AssetImage('assets/noti.png'),
              width: 29,
              height: 29,
            ),
            title:
            headerText(texto: 'Notifications', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/payicon.png'),
              width: 29,
              height: 29,
            ),
            title:
            headerText(texto: 'Payment methods', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/rewardicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(texto: 'History', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/promoicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(texto: 'Promo Code', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/settingicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(texto: 'Settings', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/inviteicon.png'),
              width: 29,
              height: 29,
            ),
            title:
            headerText(texto: 'Invite Friends', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/helpicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(texto: 'Help Center', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/abouticon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(texto: 'About us', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: gris),
          ),
          const ListTile(
            leading: Image(
              image: AssetImage('assets/logout.png'),
              width: 29,
              height: 29,
            ),
            title:
            Text('Cerrar sesión', style: TextStyle(fontWeight: FontWeight.w400)),
            trailing: Icon(Icons.chevron_right, color: gris),
           // onTap: () => _signOut(context),
          )
        ],
      ),
    );
  }
