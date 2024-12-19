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
    final size = MediaQuery.of(context).size; // Récupère la taille de l'écran

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
            icon: Icon(theme.brightness == Brightness.dark
                ? Icons.brightness_7
                : Icons.brightness_2),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.8, // 80% of the screen width
          height: size.height * 0.6, // 60% of the screen height
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme
                  .scaffoldBackgroundColor, // Couleur de fond selon le thème
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
                    style: theme.textTheme
                        .bodyLarge, // Applique le style du texte selon le thème
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionScreen(
                            theme: themeKey, toggleTheme: toggleTheme),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
