import 'package:flutter/material.dart';
import '../../models/data_model.dart';
import '../../screens/chapter_screen.dart';
import '../../screens/home_screen.dart';
import 'screens/view_screen.dart';

class OnGenerateRouter {
  Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return navigateTo(const HomeScreen());
      case '/chapter':
        final title = (settings.arguments as List)[0];
        final chapters = (settings.arguments as List)[1] as List<Data>;
        return navigateTo(ChapterScreen(chapters: chapters, title: title));
      case '/view':
        final title = (settings.arguments as List)[0];
        final data = (settings.arguments as List)[1] as List<String>;
        return navigateTo(ViewScreen(title: title, data: data));
      default:
        return navigateTo(Scaffold());
    }
  }

  navigateTo(Widget widget) {
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
