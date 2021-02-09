import 'package:delivery_template/config/theme.dart';
import 'package:delivery_template/model/account.dart';
import 'package:delivery_template/model/pref.dart';
import 'package:delivery_template/ui/login/createaccount.dart';
import 'package:delivery_template/ui/login/forgot.dart';
import 'package:delivery_template/ui/login/login.dart';
import 'package:delivery_template/ui/main/mainscreen.dart';
import 'package:delivery_template/ui/start/splash.dart';
import 'package:flutter/material.dart';
import 'config/lang.dart';

//
// Theme
//
AppThemeData theme = AppThemeData();
//
// Language data
//
Lang strings = Lang();
//
// Account
//
Account account = Account();
Pref pref = Pref();

void main() {
  theme.init();
  strings.setLang(Lang.english); // set default language - English
  runApp(AppFoodDelivery());
}

class AppFoodDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _theme = ThemeData(
      fontFamily: 'Raleway',
      primarySwatch: theme.primarySwatch,
    );

    if (theme.darkMode) {
      _theme = ThemeData(
        fontFamily: 'Raleway',
        brightness: Brightness.dark,
        unselectedWidgetColor: Colors.white,
        primarySwatch: theme.primarySwatch,
      );
    }

    return MaterialApp(
      title: strings.get(10), // "Food Delivery Flutter App UI Kit",
      debugShowCheckedModeBanner: false,
      theme: _theme,
      initialRoute: '/splash',
      //initialRoute: '/main',
      routes: {
        '/splash': (BuildContext context) => SplashScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/forgot': (BuildContext context) => ForgotScreen(),
        '/createaccount': (BuildContext context) => CreateAccountScreen(),
        '/main': (BuildContext context) => MainScreen(),
      },
    );
  }
}

dprint(String str) {
  //
  // comment this line for release app
  //
  print(str);
}
