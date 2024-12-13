// lib/screens/HomeScreen.dart

import 'package:flutter/material.dart';
import 'question_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme; // Fonction pour basculer le thème
  final Map<String, String> themes = {
    'Louis-Hadrien Theme': 'LHtheme',
    'Jolann Theme': 'JOtheme',
    'Il Theme': 'ILtheme',
    'Mathieu Theme': 'MAtheme',
  };

  HomeScreen({required this.toggleTheme}); // Ajout de toggleTheme en paramètre

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Récupère le thème actuel

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose a Theme',
          style: TextStyle(fontSize: 18, fontFamily: 'DotGothic16'),
        ),
        centerTitle: true,
        backgroundColor: theme.primaryColor, // Applique la couleur du thème actuel
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme, // Permet de basculer le thème
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor, // Couleur de fond selon le thème
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: themes.keys.length,
            itemBuilder: (context, index) {
              String themeName = themes.keys.elementAt(index);
              String themeKey = themes[themeName]!;

              return ListTile(
                title: Text(
                  themeName,
                  style: theme.textTheme.bodyLarge, // Applique le style du texte selon le thème
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(theme: themeKey),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}


