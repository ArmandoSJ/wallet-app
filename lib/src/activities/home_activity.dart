import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/src/activities/credit_card_activity.dart';
import 'package:wallet_app/src/activities/historic.dart';
import 'package:wallet_app/src/activities/user_profile_activity.dart';
import 'package:wallet_app/src/providers/ui_provider.dart';
import 'package:wallet_app/src/utils/widgets/custom_navigationbar.dart';


class HomeActivity extends StatefulWidget {

  @override
  _HomeActivityState createState() => _HomeActivityState();
  
}

class _HomeActivityState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }

}




class _HomePageBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;


    switch( currentIndex ) {
      case 0:
        return CreditCardActivity();

      case 1:
        return ServicesActivity();
        
      default:
        return ServicesActivity();
    }


  }
}