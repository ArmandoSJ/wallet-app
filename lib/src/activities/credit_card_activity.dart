import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:wallet_app/src/activities/credit_card.dart';
import 'package:wallet_app/src/data/credit-cards.dart';
import 'package:wallet_app/src/helpers/helpers.dart';
import 'package:wallet_app/src/utils/widgets/pay_button.dart';


class CreditCardActivity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
        actions: [
          IconButton(
            icon: Icon( Icons.add ), 
            onPressed: () async {

              // mostrarLoading(context);
              // await Future.delayed(Duration(seconds: 1));
              // Navigator.pop(context);
              mostrarAlerta( context, 'Hola', 'Mundo' );

            }
          )
        ],
      ),
      body: Stack(
        children: [


          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.9
              ),
              physics: BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: ( _, i ) {
                
                final tarjeta = tarjetas[i];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, navegarFadeIn(context, TarjetaPage() ));
                  },
                  child: Hero(
                    tag: tarjeta.cardNumber,
                    child: CreditCardWidget(
                      cardNumber: tarjeta.cardNumberHidden,
                      expiryDate: tarjeta.expiracyDate,
                      cardHolderName: tarjeta.cardHolderName,
                      cvvCode: tarjeta.cvv,
                      showBackView: false,
                    ),
                  ),
                );

              }
            ),
          ),


          Positioned(
            bottom: 0,
            child: TotalPayButton()
          )


          
        ],
      )
   );
  }
}