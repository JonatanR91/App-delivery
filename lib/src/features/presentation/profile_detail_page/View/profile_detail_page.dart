import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/backButtons/back_button.dart';
import 'package:yes_no_app/src/features/presentation/profile_detail_page/components/avatar_view.dart';
import 'package:yes_no_app/src/features/presentation/profile_detail_page/components/textfields_view.dart';
import 'package:yes_no_app/src/utils/Extensions/screen_size.dart';
import 'package:yes_no_app/src/utils/styles/box_decoration_shadows.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        title: headerText(texto: 'Edit profile',fontSize: 17),
        backgroundColor: white,
        elevation: 0.4,
        leading: Builder(
          builder:(BuildContext context ) {
           return backButton(context, Colors.black); 
          }
          ),
          actions: [GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20, right: 15.0),
              child: headerText(
                texto: 'Done',
                color: orange,
                fontWeight: FontWeight.w500,
                fontSize: 17.0)
            ),
          )],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.only(top: getScreenHeight(
                  context: context, multiplier: 0.1),
                  left: 15,
                  right: 15.0),
                
                decoration: createBoxDecorationWithShadows(),
                width: getScreenWidth(context: context),
                height: getScreenHeight(
                  context: context,multiplier : 0.6),
                  child: Column(
                    children: [
                      Transform.translate(
                    // ignore: prefer_const_constructors
                    offset: Offset(0, -60),
                    child: AvatarView(
                        backgroundImage:
                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                  ),
                  TextFieldsProfileDetailView()
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