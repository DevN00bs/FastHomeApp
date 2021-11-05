import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fast_home/services/ui_provider.dart';
import 'package:fast_home/pages/home_page.dart';
import 'package:fast_home/pages/initial_page.dart';
import 'package:fast_home/pages/search_page.dart';
import 'package:fast_home/pages/user_page.dart';
import 'package:fast_home/pages/pages_page.dart';
import 'package:fast_home/pages/detail_page.dart';
import 'package:fast_home/pages/login_page.dart';
import 'package:fast_home/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              new UiProvider(), //(_) when build context is not needed
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FastHome',
          initialRoute: 'initial_page',
          routes: {
            'home_page': (_) => HomePage(),
            'initial_page': (_) => InitialPage(),
            'search_page': (_) => SearchPage(),
            'user_page': (_) => UserPage(),
            'pages_page': (_) => PagesPage(),
            'info_page': (_) => DetailPage(),
            'login_page': (_) => LoginPage(),
            'register_page': (_) => RegisterPage(),
          },
          //TODO: colors here
          theme: appTheme()),
    );
  }
}

appTheme() {
  return ThemeData(
    primaryColor: Colors.indigo[300],
  );
}
