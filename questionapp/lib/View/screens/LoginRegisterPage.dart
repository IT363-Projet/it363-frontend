import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Model/models/AppTheme.dart'; 

class LoginRegisterPage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const LoginRegisterPage({required this.toggleTheme});

  @override
  LoginRegisterPageState createState() => LoginRegisterPageState();
}

class LoginRegisterPageState extends State<LoginRegisterPage> {
  bool isLogin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void toggleForm() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  Future<void> _login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged in successfully!')),
      );
      // Redirection vers HomeScreen avec le thème dynamique
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(toggleTheme: widget.toggleTheme),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
    }
  }

  Future<void> _register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );
      // Redirection vers HomeScreen avec le thème dynamique
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(toggleTheme: widget.toggleTheme),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login / Register'),
        backgroundColor: AppTheme('light').themeData.primaryColor, // Utilisation du thème
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme, // Basculer entre clair et sombre
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF9AC8EB),
        ),
        child: Center(
          child: Container(
            width: 800,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.125),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 25,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Formulaire Sign In
                AnimatedOpacity(
                  opacity: isLogin ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: _buildLoginForm(),
                ),
                // Formulaire Sign Up
                AnimatedOpacity(
                  opacity: isLogin ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: _buildRegisterForm(),
                ),
                // Boutons pour basculer entre les formulaires
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: toggleForm,
                    child: Text(
                      isLogin
                          ? "Don't have an account? Register"
                          : "Already have an account? Login",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }TextEditingController emailController = TextEditingController();TextEditingController passwordController = TextEditingController();

  Widget _buildLoginForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign In",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9AC8EB),
              foregroundColor: const Color(0xFFEBF4F3),
            ),
            onPressed: () {
              _login(emailController.text, passwordController.text);
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          // Champ Email
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          // Champ Mot de Passe
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          // Champ Confirmation du Mot de Passe
          TextFormField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9AC8EB),
              foregroundColor: const Color(0xFFEBF4F3),
            ),
            onPressed: () {
              // Vérification si les mots de passe correspondent
              if (passwordController.text != confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Passwords do not match!')),
                );
                return;
              }

              // Appel à la fonction _register
              _register(emailController.text, passwordController.text);
            },
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
