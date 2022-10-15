import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wefind/screens/group_form_screen.dart';
import 'package:wefind/screens/youth_group_screen.dart';
import 'firebase_options.dart';

import 'design/app_theme.dart';
import 'screens/home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/': (_) => HomeScreen(),
        GroupFormScreen.routeName: (_) => GroupFormScreen(),
      },
      // Why we use both 'routes' and 'onGenerate Routes': routes is static and doesn't offer functionalities
      // like passing an argument to the widget, implementing a different PageRoute etc, which is why onGenerateRoute exists.
      // See: https://stackoverflow.com/questions/59822279/difference-between-ongenerateroute-and-routes-in-flutter
      onGenerateRoute: (settings) {
        var uri = Uri.parse(settings.name!);
        String name = uri.pathSegments[0];
        return MaterialPageRoute(builder: (context) => YouthGroupScreen(name));
      },
    );
  }
}
