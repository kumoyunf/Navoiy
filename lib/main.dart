import 'package:flutter/material.dart';
import 'package:navoiy/provider/animation_provider.dart';
import 'package:navoiy/provider/text_settings.dart';
import 'package:provider/provider.dart';
import 'app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => TextSettings()),
    ChangeNotifierProvider(create: (ctx) => AnimationProvider()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: OnGenerateRouter().router,
    );
  }
}
