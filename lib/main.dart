import 'package:flutter/material.dart';
import 'package:foodrec/pages/detail_page.dart';
import 'package:foodrec/pages/favorite_page.dart';
import 'package:foodrec/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/favorite': (context) => const FavoritePage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
