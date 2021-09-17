
import 'package:flutter/material.dart';
import 'package:wallet_app/src/utils/constants/constants.dart';

class BackgroundApp extends StatelessWidget {
  final Widget child;
  final bool disabledImage;
  const BackgroundApp(
      {Key? key, required this.child, this.disabledImage = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BackGround(),
          _HeaderImage(disabledImage: disabledImage),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final bool disabledImage;
  const _HeaderImage({Key? key, this.disabledImage = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Visibility(
        visible: disabledImage,
        child: Container(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: const <Widget>[
              Image(
                image: AssetImage("assets/logo.png"),
                height: 80.0,
              ),
              SizedBox(height: 10.0, width: double.infinity), //centra la imagen
            ],
          ),
        ),
      ),
    );
  }
}

class _BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _decoration(),
    );
  }

  BoxDecoration _decoration() =>  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.30, 0.6),
          colors: <Color>[Constants.kLightYellow],
          tileMode: TileMode.repeated,
        ),
      );
}