import 'package:flutter/material.dart';
import 'package:questionapp/Model/models/AppMode.dart';
import 'package:questionapp/View/screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ViewModel/FirebaseOptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'View/screens/LoginRegisterPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class AuthCheck extends StatelessWidget {
  final VoidCallback toggleTheme;

  const AuthCheck({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user != null) {
            return HomeScreen(toggleTheme: toggleTheme);
          }
          return LoginRegisterPage(toggleTheme: toggleTheme);
        }
        // écran de chargement
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _themeMode = 'light'; // Mode par défaut

  // Fonction pour basculer entre les thèmes
  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == 'light' ? 'dark' : 'light';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionnaire App',
      theme: AppTheme(_themeMode).themeData, // Utilisation du constructeur factory avec cache
      home: AuthCheck(toggleTheme: _toggleTheme),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Factory pour gérer les thèmes
class ThemeFactory {
  static ThemeData createTheme(String mode) {
    if (mode == 'dark') {
      return ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      );
    } else {
      return ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      );
    }
  }
}