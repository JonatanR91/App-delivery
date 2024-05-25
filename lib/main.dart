import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/src/Base/Views/BaseView.dart';
import 'package:yes_no_app/src/features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:yes_no_app/src/features/presentation/StateProviders/UserStateProvider.dart';
import 'package:yes_no_app/src/routes/routes.dart';
import 'src/features/presentation/StateProviders/ErrorStateProvider.dart';
import 'src/features/presentation/StateProviders/LoadingStateProvider.dart';


void main() => runApp(const AppState());
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ErrorStateProvider()),
      ChangeNotifierProvider(create: (_) => LoadingStateProvider()),
      ChangeNotifierProvider(create: (_) => DefaultUserStateProvider())
    ],
    child: MyAppUserState());
  }
}
class MyAppUserState extends StatelessWidget with BaseView{

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: coordinator.start(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData){
            Provider.of<DefaultUserStateProvider>(context).fetchUserData(localId: MainCoordinator.sharedInstance?.userUid ??"");
            return MyApp(initialRoute: snapshot.data);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}


class MyApp extends StatelessWidget {

  final String _initialRoute;

   MyApp({required String initialRoute}): _initialRoute = initialRoute;

  @override
  Widget build(BuildContext context) {

Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: _initialRoute,
     localizationsDelegates: const[
       GlobalMaterialLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
       GlobalCupertinoLocalizations.delegate,
     ],
      supportedLocales: const [
        Locale('en',''),
        Locale('es',''),
      ],
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(10, 31, 68, 1.0),
          disabledColor: const Color.fromRGBO(142, 142, 147, 1.2),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color.fromRGBO(255, 140, 0, 1.0))),
    );
  }
}
