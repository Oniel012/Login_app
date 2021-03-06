import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Tech',
      theme: ThemeData(
       textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
      primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=> LoginScreen(),
        'ForgotPassword': (context)=> ForgotPassword(),
        'CreateNewAccount': (context)=> CreateNewAccount()
      },
    );
  }
}

