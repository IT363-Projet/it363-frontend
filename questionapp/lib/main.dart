import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Assure que les bindings Flutter sont initialisés avant d'exécuter du code asynchrone
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialise Firebase

  runApp(MyApp()); // Lance l'application
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


