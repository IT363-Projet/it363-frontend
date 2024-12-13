import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData themeData;

  // Cache statique pour les thèmes
  static final Map<String, AppTheme> _cache = {};

  // Constructeur privé
  AppTheme._(this.themeData);

  // Constructeur factory avec gestion du cache
  factory AppTheme(String mode) {
    // Vérifie si le thème est déjà dans le cache
    if (_cache.containsKey(mode)) {
      return _cache[mode]!;
    }

    // Sinon, crée une nouvelle instance et la met dans le cache
    if (mode == 'dark') {
      _cache[mode] = AppTheme._(
        ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white70),
          ),
        ),
      );
    } else {
      _cache[mode] = AppTheme._(
        ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black54),
          ),
        ),
      );
    }

    // Retourne l'instance créée ou existante
    return _cache[mode]!;
  }
}
