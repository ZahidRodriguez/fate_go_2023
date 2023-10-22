import 'package:fate_go_2023/providers/movies_provider.dart';
import 'package:fate_go_2023/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => MoviesProvider(),lazy: false,)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fate/Grand Order',
      initialRoute: 'home',
      routes: {
        'home':(_) => HomeScreen(),
        'details':(_)=>DetailsScreen(),
      },
    );
  }
}