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
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }
        var uri = Uri.parse(settings.name!);
        // print(uri.pathSegments);
        String name = uri.pathSegments[0];
        return MaterialPageRoute(builder: (context) => YouthGroupScreen(name));
      },
    );
  }
}
