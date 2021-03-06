import 'package:delivery_template/ui/main/statistics.dart';
import 'package:flutter/material.dart';
import 'package:delivery_template/main.dart';
import 'package:delivery_template/model/order.dart';
import 'package:delivery_template/ui/main/account.dart';
import 'package:delivery_template/ui/main/header.dart';
import 'package:delivery_template/ui/main/map.dart';
import 'package:delivery_template/ui/main/notification.dart';
import 'package:delivery_template/ui/main/orders.dart';
import 'package:delivery_template/ui/menu/help.dart';
import 'package:delivery_template/ui/menu/language.dart';
import 'package:delivery_template/ui/main/orderdetails.dart';
import 'package:delivery_template/ui/menu/menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {

  //////////////////////////////////////////////////////////////////////////////////////////////////////
  //
  //
  //

  _openMenu(){
    print("Open menu");
    setState(() {
      _scaffoldKey.currentState.openDrawer();
    });
  }

  //
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  var windowWidth;
  var windowHeight;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _currentPage = "orders";
  Map<String, dynamic> _params = {};

  @override
  void initState() {
    _initDistance();
    account.setRedraw(_redraw);
    super.initState();
  }

  _initDistance() async {
    await ordersSetDistance();
    setState(() {

    });
  }


  _redraw(){
    setState(() {
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    var _headerText = strings.get(21); //
    switch(_currentPage){
      case "statistics":
        _headerText = strings.get(79); // "Statistics",
      break;
      case "orderDetails":
        _headerText = strings.get(56); // "Order Details",
      break;
      case "map":
        _headerText = strings.get(89); // "Map",
      break;
      case "language":
        _headerText = strings.get(28); // "Languages",
        break;
      case "account":
        _headerText = strings.get(27); // "Account",
        break;
      case "help":
        _headerText = strings.get(38); // "Help & support",
        break;
      case "notification":
        _headerText = strings.get(25); // "Notifications",
        break;
      case "orders":
        _headerText = strings.get(24); // "Orders",
        break;
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(context: context, callback: routes,),
      backgroundColor: theme.colorBackground,
      body: Stack(
        children: <Widget>[

          if (_currentPage == "statistics")
            StatisticsScreen(callback: routes),
          if (_currentPage == "orderDetails")
            OrderDetailsScreen(callback: routes),
          if (_currentPage == "map")
            MapScreen(callback: routes, params: _params,),
          if (_currentPage == "language")
            LanguageScreen(),
          if (_currentPage == "account")
            AccountScreen(callback: routes),
          if (_currentPage == "help")
            HelpScreen(),
          if (_currentPage == "notification")
            NotificationScreen(callback: routes),
          if (_currentPage == "orders")
            OrdersScreen(callback: routes2),

          Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Header(title: _headerText, onMenuClick: _openMenu, callback: routes)
          ),

        ],
      ),
    );
  }

  routes(String route){
    if (route != "redraw")
      _currentPage = route;
    setState(() {
    });
  }

  routes2(String route, Map<String, dynamic> params){
    _params = params;
    if (route != "redraw")
      _currentPage = route;
    setState(() {
    });
  }
}

