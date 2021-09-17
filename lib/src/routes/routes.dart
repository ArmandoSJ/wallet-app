import 'package:flutter/material.dart';
import 'package:wallet_app/src/activities/credit_card_activity.dart';
import 'package:wallet_app/src/activities/home_activity.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
    'home'         : ( BuildContext context ) => HomeActivity(),
    'credit-card'         : ( BuildContext context ) => CreditCardActivity(),
  };

}