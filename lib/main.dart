import 'package:flutter/material.dart';
import 'package:flutter_default_state_manager/home_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Default State Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, 
          brightness: Brightness.dark,
          surfaceTint: Colors.transparent,
        ).copyWith(background: Colors.grey[850]!),
        appBarTheme: AppBarTheme(
          elevation: 4.0,
          shadowColor: Theme.of(context).colorScheme.shadow,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}