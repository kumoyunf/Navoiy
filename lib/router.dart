import 'package:flutter/material.dart';
import 'package:navoiy/models/author_model.dart';
import 'package:navoiy/screens/author_screen.dart';
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
      case '/authors':
        final authors = settings.arguments as List<Author>;
        return navigateTo(AuthorScreen(authors: authors));
      default:
        return navigateTo(Scaffold());
    }
  }

  navigateTo(Widget widget) {
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
