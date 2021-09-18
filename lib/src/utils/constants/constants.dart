//URL BASE
import 'package:flutter/material.dart';

class Constants {


  static const String URL_BASE = "http://localhost:8080";
  static const String URL_LOGIN = "/login";
  static const String URL_REGISTER = "/register";
  static const String URL_SERVICES = "/liberet/services";
  static const String URL_ADD_SERVICE = "/supplier/addservice";
  static const String URL_UPDATE_CREDITS = "/supplier/wallet/recharge";
  static const String URL_HISTORIC = "/supplier/wallet/historic";
  static const String URL_DO_PAYMENT = "/wallet/dopayment";

  static const vPrimaryColor = Color(0xFF6F35A5);
  static const vPrimaryLightColor = Color(0xFF0D47A1);
  static const Color kLightYellow = Color(0xFFFFF9EC);
  static const Color kLightYellow2 = Color(0xFFFFE4C7);
  static const Color kDarkYellow = Color(0xFFF9BE7C);
  static const Color kPalePink = Color(0xFFFED4D6);
  static const Color kPurpeLight = Color(0xFFE1BEE7);
  static const Color kRed = Color(0xFFE46472);
  static const Color kLavender = Color(0xFFD5E4FE);
  static const Color kBlue = Color(0xFF6488E4);
  static const Color kLightGreen = Color(0xFFD9E6DC);
  static const Color kGreen = Color(0xFF309397);

  static const Color kDarkBlue = Color(0xFF0D253F);

  static const double padding = 20;
  static const double avatarRadius = 45;

  static Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Constants.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon(Icon iconAvatar) {
    return CircleAvatar(
        radius: 25.0, backgroundColor: Constants.kGreen, child: iconAvatar);
  }
}