import 'dart:ui';
import 'package:fast_home/pages/check_auth_screen.dart';
import 'package:fast_home/services/auth_service.dart';
import 'package:fast_home/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fast_home/services/ui_provider.dart';
import 'package:fast_home/pages/home_page.dart';
import 'package:fast_home/pages/initial_page.dart';
import 'package:fast_home/pages/initial_page_alt.dart';
import 'package:fast_home/pages/search_page.dart';
import 'package:fast_home/pages/user_page.dart';
import 'package:fast_home/pages/pages_page.dart';
import 'package:fast_home/pages/detail_page.dart';
import 'package:fast_home/pages/login_page.dart';
import 'package:fast_home/pages/register_page.dart';

void main() => runApp(MyApp());

/*

reiniciar sesión a home

snackbar failed login

(quitar change password)**
forgot password**

 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              new UiProvider(), //(_) when build context is not needed
        ),
        ChangeNotifierProvider(
          create: (_) =>
              new AuthService(), //to know user status
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FastHome',
          initialRoute: 'checking_page',
          routes: {
            'home_page': (_) => HomePage(),
            'initial_page': (_) => InitialPage(),
            'search_page': (_) => SearchPage(),
            'user_page': (_) => UserPage(),
            'pages_page': (_) => PagesPage(),
            'info_page': (_) => DetailPage(),
            'login_page': (_) => LoginPage(),
            'register_page': (_) => RegisterPage(),
            'checking_page': (_) => CheckAuthPage(),
          },
          scaffoldMessengerKey: NotificationsService.messengerKey,//not instanced because static
          //TODO: colors here
          //theme: ThemeData.dark()),
          theme: appTheme()),
    );
  }
}

appTheme() {
  return ThemeData(
    primaryColor: Color(0xFF335C67),
    accentColor: Color(0xFFC8553D)
    //primaryColor: Colors.white,
  );
}
