import 'package:flutter/material.dart';

// Définition de la classe AppTheme

class AppTheme {

  final ThemeData themeData;
  static final Map<String, AppTheme> _cache = {};
  AppTheme._(this.themeData);
  // Constructeur de AppTheme
  factory AppTheme(String mode) {
    
    if (mode != 'dark' && mode != 'light') {
      throw ArgumentError(
          'Invalid theme mode: $mode. Use "dark" or "light" instead.');
    }
    
    if (_cache.containsKey(mode)) {
      return _cache[mode]!;
    }
    try {
      if (mode == 'dark') {
        // Configuration du thème sombre
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
        // Configuration du thème clair
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
    } catch (e) {   
      throw StateError('Failed to create theme: $e');
    }
    return _cache[mode]!;
  }
}

