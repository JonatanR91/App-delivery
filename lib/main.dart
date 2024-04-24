import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/src/features/presentation/Stateprovider/ErrorstateProvider.dart';
import 'package:yes_no_app/src/features/presentation/Stateprovider/LoadingStateProvider.dart';
import 'package:yes_no_app/src/routes/routes.dart';


void main() => runApp(const AppState());
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ErrorStateProvider()),
    ChangeNotifierProvider(create: (_) => LoadingStateProvider())
    ],
    child: MyApp(),);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: 'welcome',
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
