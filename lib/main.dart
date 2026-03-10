import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/core/internet_checker.dart';
import 'package:news/core/theme/bloc/cubit.dart';
import 'package:news/core/theme/bloc/states.dart';
import 'package:news/di.dart';
import 'package:news/models/news_response_adapter.dart';
import 'package:news/models/sources_response_adapter.dart';
import 'package:news/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InternetConnectivity().initialize();
  configureDependencies();
  Hive.initFlutter();
  Hive.registerAdapter(NewsResponseAdapter());
  Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(SourcesResponseAdapter());
  Hive.registerAdapter(SourcesAdapter());

  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (context, state) {
            return MyApp();
          }
      )
    ,
  ),
  );
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