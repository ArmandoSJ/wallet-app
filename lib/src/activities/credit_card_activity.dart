import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/src/activities/historic.dart';
import 'package:wallet_app/src/data/credit-cards.dart';
import 'package:wallet_app/src/helpers/helpers.dart';
import 'package:wallet_app/src/providers/auth_provider.dart';
import 'package:wallet_app/src/utils/widgets/pay_button.dart';

class CreditCardActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      //final authService = Provider.of<SessionProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Wallet digital Liberet'),
          leading : IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () async{
                  //authService.logout();
                  Navigator.pushReplacementNamed(context, 'login');
            }
          )
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: 10,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  physics: BouncingScrollPhysics(),
                  itemCount: tarjetas.length,
                  itemBuilder: (_, i) {
                    final tarjeta = tarjetas[i];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            navegarFadeIn(context, ServicesActivity()));
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
                  }),
            ),
            Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
