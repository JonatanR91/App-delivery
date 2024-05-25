import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/presentation/ProfileDetailPage/View/ProfileDetailPageView.dart';
import 'package:yes_no_app/src/features/presentation/sing_up_page/View/sing_up_page.dart';
import 'package:yes_no_app/src/features/presentation/tabs/TabsPage/View/tabs_page.dart';
import 'package:yes_no_app/src/features/presentation/welcome_page/View/welcome_page.dart';



final routes = <String, WidgetBuilder> {
 'welcome': (BuildContext context) => WelcomePage(),
// 'login': (BuildContext context) => LoginPage(),
 //'forgot-password': (BuildContext context) => UpdatePasswordPage(),
 'sign-up': (BuildContext context) => SignUpPage(),
 'Tabs': (BuildContext context) =>  TabsPage(),
 'profile-detail': (BuildContext context) => const ProfileDetailPage(),
 //'checkout': (BuildContext context) => CheckOutPage(),
 //RoutesPaths.editPasswordPath : (BuildContext context) => const EditPasswordPage(),
 //RoutesPaths.editEmailPath : (BuildContext context) => const EditEmailPage(),
 //RoutesPaths.changePaymentMethodsPath : (BuildContext context) => const ChangePaymentsMethodsPage()
};
