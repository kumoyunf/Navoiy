import 'package:flutter/material.dart';
import 'package:navoiy/screens/home_screen.dart';

class OnGenerateRouter {
  Route<dynamic>? router(RouteSettings settings){
    switch(settings.name){
      case '/':
        return navigateTo(const HomeScreen());
      default:
        return navigateTo(Scaffold());
    }
  }
  navigateTo(Widget widget){
    return MaterialPageRoute(builder: (ctx)=>widget);
  }
}