import 'package:flutter/material.dart';
import 'package:visual/pages/login_screen.dart';
import 'package:visual/pages/sign_in_screen.dart';
import 'package:visual/static/HomePage.dart';
import 'package:visual/static/Turma.dart';
import 'package:visual/pages/CreateUserPage.dart';
import 'package:provider/provider.dart';
import 'package:visual/provider/UserProvider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      initialRoute: '/login',
      routes: {
        
        '/homepage': (context) => HomePage(),
        '/turma': (context) => const Turma(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignInScreen(),
        '/createuser': (context) => const CreateUserPage(),

      },

      theme: ThemeData(
        textTheme: const TextTheme(

          bodyLarge: TextStyle(fontFamily: 'Montserrat'),
          bodyMedium: TextStyle(fontFamily: 'Montserrat'),
          bodySmall: TextStyle(fontFamily: 'Montserrat'),
          headlineLarge: TextStyle(fontFamily: 'Montserrat'),
          headlineMedium: TextStyle(fontFamily: 'Montserrat'),
          headlineSmall: TextStyle(fontFamily: 'Montserrat'),
          titleLarge: TextStyle(fontFamily: 'Montserrat'),
          titleMedium: TextStyle(fontFamily: 'Montserrat'),
          titleSmall: TextStyle(fontFamily: 'Montserrat'),
          labelLarge: TextStyle(fontFamily: 'Montserrat'),
          labelMedium: TextStyle(fontFamily: 'Montserrat'),
          labelSmall: TextStyle(fontFamily: 'Montserrat'),
          
        ),
        primarySwatch: Colors.blue,
      ),
    );
  }
}