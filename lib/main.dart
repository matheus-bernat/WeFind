import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wefind/screens/youth_group_screen.dart';
import 'firebase_options.dart';

import 'design/app_theme.dart';
import 'screens/home_screen.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeFind - Groupes de prière étudiants en Suisse',
      theme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => HomeScreen(),
        YouthGroupScreen.routeName: (ctx) => YouthGroupScreen()
      },
    );
  }
}
