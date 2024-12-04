import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionnaire App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Couleur principale de l'application
      ),
      home: HomeScreen(), // Page d'accueil
      debugShowCheckedModeBanner: false, // Supprime le bandeau "Debug"
    );
  }
}

