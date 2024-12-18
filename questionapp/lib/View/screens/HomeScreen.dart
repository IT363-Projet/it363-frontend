import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'QuestionScreen.dart';
import 'LoginRegisterPage.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme; // Fonction pour basculer le thème
  final Map<String, String> themes = {
    'Space': 'Space',
    'Geography': 'Geography',
    'Sci-Fi Movies': 'SciFiMovies',
    'Mythology': 'Mythology',
    'Sports': 'Sports',
  };

  HomeScreen({required this.toggleTheme});

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginRegisterPage(toggleTheme: toggleTheme),
      ),
    );
  }

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
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
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
