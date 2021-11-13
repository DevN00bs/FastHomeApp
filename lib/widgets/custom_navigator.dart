import 'package:flutter/material.dart';
import 'package:provider/provider.dart';// install both providers
import 'package:fast_home/services/ui_provider.dart';


class CustomNavigator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black
          )
        ]
      ),
      child: BottomNavigationBar(
          onTap: ( int i ) => uiProvider.selectedMenuOpt = i,
          currentIndex: currentIndex,
          elevation: 0,
          selectedItemColor: Color(0xFF335C67),
          items: [
            BottomNavigationBarItem(
              icon: Icon( Icons.home ),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon( Icons.search ),
              label: 'Search'
            ),
            BottomNavigationBarItem(
              icon: Icon( Icons.person ),
              label: 'Profile'
            ),
          ],
        ),
    );
  }
}