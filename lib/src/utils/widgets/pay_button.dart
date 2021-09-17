import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/src/providers/epay_provider.dart';

class TotalPayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Credits',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              SingleChildScrollView(
                child: Column(
                  children: [
                    ChangeNotifierProvider(
                      create: (_) => EpayProvider(),
                      child: _FormPayment(),
                    )
                  ],
                ),
              ),
              // _FormPayment()
            ],
          ),
          _BtnPay()
        ],
      ),
    );
  }
}

class _FormPayment extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  //final Totales totales;
  EpayProvider? epayForm;
  _FormPayment({Key? key}) : super(key: key);
  BuildContext? context;
  Size? size;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    size = MediaQuery.of(context).size;
    epayForm = Provider.of<EpayProvider>(context);
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Row(
          children: <Widget>[_TextFieldCredits()],
        ),
      ),
    );
  }

/*   MaterialButton btnLogIn() => MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.green,
      elevation: 0,
      minWidth: size!.width,
      color: Colors.blue.shade900,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: Text(
            epayForm!.isLoading ? 'Procesando Pago' : 'Realiza Pago',
            style: TextStyle(color: Colors.white),
          )),
      onPressed: epayForm!.isLoading ? null : _submit);

  void _submit() async {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState!.save();

    epayForm!.isLoading = true;

    //ApplyPayment.showFormPayment(totales, context!);
  } */
}

class _TextFieldCredits extends StatelessWidget {
  const _TextFieldCredits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _BtnPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return true ? buildBotonTarjeta(context) : buildAppleAndGooglePay(context);
  }

  Widget buildBotonTarjeta(BuildContext context) {
    return MaterialButton(
        height: 45,
        minWidth: 170,
        shape: StadiumBorder(),
        elevation: 0,
        color: Colors.black,
        child: Row(
          children: [
            //Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white),
            Text('Recargar creditos',
                style: TextStyle(color: Colors.white, fontSize: 22)),
          ],
        ),
        onPressed: () {});
  }

  Widget buildAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
        height: 45,
        minWidth: 150,
        shape: StadiumBorder(),
        elevation: 0,
        color: Colors.black,
        child: Row(
          children: [
            Icon(
                Platform.isAndroid
                    ? FontAwesomeIcons.google
                    : FontAwesomeIcons.apple,
                color: Colors.white),
            Text('Pagar', style: TextStyle(color: Colors.white, fontSize: 22)),
          ],
        ),
        onPressed: () {});
  }
}
