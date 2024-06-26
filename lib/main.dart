import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model.dart';
import 'package:restaurant_app/ui/detail_page.dart';
import 'package:restaurant_app/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => DetailPage(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant
        )
      },
    );
  }
}