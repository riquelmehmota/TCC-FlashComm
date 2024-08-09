import 'package:flutter/material.dart';
import 'package:tcc/Providers/user_provider.dart';
import 'package:tcc/pages/login_screen.dart';
import 'package:tcc/pages/sign_in_screen.dart';
import 'package:tcc/static/HomePage.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => UserProvider(),
      child: MaterialApp(
        routes: {
          '/login': (context) => LoginScreen(),
          "/home": (context) => HomePage(),
          "/signup": (context) => SignUpScreen(),
        },

        theme: ThemeData(
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            headlineLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            titleSmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            bodySmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            labelLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            labelSmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          ),
        ),
        home: LoginScreen(),
      )
      
    );
  }
}
