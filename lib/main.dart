import 'package:flutter/material.dart';
import 'package:news/core/internet_checker.dart';
import 'package:news/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InternetChecker().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}