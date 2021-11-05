import 'package:fast_home/services/ui_provider.dart';
import 'package:fast_home/widgets/custom_navigator.dart';

import 'package:fast_home/pages/home_page.dart';
import 'package:fast_home/pages/search_page.dart';
import 'package:fast_home/pages/user_page.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FastHome'),
        ),
        body: _PagesPageBody(),
        bottomNavigationBar: CustomNavigator(),
      );
  }
}

class _PagesPageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch ( currentIndex ) {
      case 0:
        return HomePage();

      case 1:
        return SearchPage();
      
      case 2:
        return UserPage();
      
      default:
        return HomePage();
    }

  }
}