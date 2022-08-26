import 'package:flutter/material.dart';

class YouthGroupScreen extends StatelessWidget {
  // final YouthGroup youthGroup;

  YouthGroupScreen();
  

  // late final routeName = '/${args.arguments.name.replaceAll(' ', '-').toLowerCase()}'; // e.g. 'Adoray Lausanne' -> '/adoray-lausanne'
  static const routeName = 'adoray-lausanne'; // HARD-CODED

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? name = routeArgs['name'];

    return Scaffold(
      body: Container(
        child: Text('This is the thing of $name'),
      ),
    );
  }
}
