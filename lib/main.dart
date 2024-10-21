import 'package:flutter/material.dart';
import 'package:navoiy/provider/text_settings.dart';
import 'package:provider/provider.dart';
import 'router.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => TextSettings())],
      child: const MainApp()));
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
