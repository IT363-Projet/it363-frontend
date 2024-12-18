import 'package:flutter/material.dart';
import 'QuestionScreen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme; // Fonction pour basculer le thème
  final Map<String, String> themes = {
    'Theme 1': 'Thème 1',
    'Theme 2': 'JOtheme',
    'Theme 3': 'ILtheme',
    'Theme 4': 'MAtheme',
  };

  HomeScreen({required this.toggleTheme}); 

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
        backgroundColor: theme.primaryColor,
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


