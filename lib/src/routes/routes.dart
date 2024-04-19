import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/presentation/collection_detail_page/View/collection_detail_page.dart';
import 'package:yes_no_app/src/features/presentation/collections_page/View/collections_page.dart';
import 'package:yes_no_app/src/features/presentation/filter_page/View/filter_page.dart';
import 'package:yes_no_app/src/features/presentation/fotgot_password_page/View/foget_password.dart';
import 'package:yes_no_app/src/features/presentation/login_page/View/login_page.dart';
import 'package:yes_no_app/src/features/presentation/profile_detail_page/View/profile_detail_page.dart';
import 'package:yes_no_app/src/features/presentation/search_page/View/search_page.dart';
import 'package:yes_no_app/src/features/presentation/sing_up_page/View/sing_up_page.dart';
import 'package:yes_no_app/src/features/presentation/tabs/tabs_page.dart';
import 'package:yes_no_app/src/features/presentation/welcome_page/View/welcome_page.dart';
import 'package:yes_no_app/src/features/presentation/place_detail_page/View/place_detail_page.dart';



final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => const WelcomePage(),
 'login': (BuildContext context) => const LoginPage(),
  'forgot-password': (BuildContext context) => const ForgotPassword(),
  'sing-up': (BuildContext context) => const SignUpPage(),
  'tabs': (BuildContext context) =>  const TabsPage(),
  'search': (BuildContext context) =>  const SearchPage(),
  'filter': (BuildContext context) =>  const FilterPage(),
  'collections': (BuildContext context) =>  const CollectionsPage(),
  'collections-detail': (BuildContext context) =>  const CollectionDetailPage(),
  'place-detail': (BuildContext context) => const PlaceDetailPage(),
  'profile-detail': (BuildContext context) => const ProfileDetailPage()

};
