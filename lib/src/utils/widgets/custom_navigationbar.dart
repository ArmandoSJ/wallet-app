import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/src/providers/ui_provider.dart';


class CustomNavigationBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: ( int i ) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon( Icons.account_circle ),
          label: 'Recarga de crédito'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.search , size: 20.0),
          label: 'Histórico'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.people, size: 20.0),
          label: 'Servicios disponibles'
        ),      
      ],
    );
  }
}

