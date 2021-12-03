import 'package:fast_home/services/ui_provider.dart';
import 'package:fast_home/widgets/custom_navigator.dart';

import 'package:fast_home/pages/pages_export.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottomOpacity: 0.0,
          elevation: 1,
          //added background color
          backgroundColor: Theme.of(context).primaryColor,
        /*  
            title: Text(
            'FastHome',
            style: TextStyle( fontSize: 30, color: Color(0xFF335C67) ),
            ),
        */    
            title: Image.asset(
            'images/loginLogoWhite.png',
            height: 45,
          ),
            
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