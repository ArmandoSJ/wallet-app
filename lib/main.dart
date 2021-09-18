import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/src/providers/providers.dart';
import 'package:wallet_app/src/providers/ui_provider.dart';
import 'package:wallet_app/src/routes/routes.dart';
import 'package:wallet_app/src/utils/notification-app.dart';

/*
 * developed by asalazarj
 */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'wallet-digital',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('es', 'ES'), // Spanish
        ],
        scaffoldMessengerKey: NotificationsApp.messengerKey,
        initialRoute: 'login',
        routes: getApplicationRoutes(),
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.grey[300],
            appBarTheme: AppBarTheme(elevation: 0, color: Colors.blue.shade900),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.blue.shade100, elevation: 0)),
      
    );
  }
}
