// lib/screens/HomeScreen.dart

import 'package:flutter/material.dart';
import 'question_screen.dart';

class HomeScreen extends StatelessWidget 
{
    final Map<String, String> themes = 
    {
      'Louis-Hadrien Theme': 'LHtheme',
      'Jolann Theme': 'JOtheme',
      'Il Theme': 'ILtheme',
      'Mathieu Theme': 'MAtheme',
    };

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold
        (  
            appBar: AppBar(title: Text('Choose a Theme', style: TextStyle(fontSize: 18, fontFamily: 'DotGothic16'),), centerTitle : true,),                           
            body: Center(child : Container 
            ( 
                padding: EdgeInsets.all(16.0),
                constraints: BoxConstraints(maxWidth: 400), 
                child : ListView.builder
                (              
                    itemCount: themes.keys.length,
                    itemBuilder: (context, index) 
                    {
                        String themeName = themes.keys.elementAt(index);
                        String themeKey = themes[themeName]!;

                        return ListTile
                        (
                            title: Text(themeName, style: TextStyle(fontSize: 18, fontFamily: 'DotGothic16'),),trailing: Icon(Icons.arrow_forward),
                            onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => QuestionScreen(theme: themeKey),),);},  // Naviguer vers la page des questions avec le bon thème
                        );
                    },
                ),
            ))
        );
    }
}
