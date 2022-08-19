import 'package:flutter/material.dart';

import 'package:wefind/models/youth_group.dart';
import 'package:wefind/widgets/map_sample.dart';
import 'widgets/youth_group_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeFind',
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromARGB(255, 230, 225, 225),
                  fontWeight: FontWeight.bold
                ),
                headline6:
                    const TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
              )),
      // home: MyHomePage(title: 'WeFind'),
      home: MapSample(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<YouthGroup> _youthGroups = [
    YouthGroup(
      id: 0,
      name: 'Adoray Lausanne',
      city: 'Lausanne',
      isVisible: false,
      instagram: 'https://www.instagram.com/adoraylausanne/',
      website: 'https://www.adoray.ch/orte/lausanne/',
    ),
    YouthGroup(
      id: 1,
      name: 'Other group',
      city: 'Lausanne',
      isVisible: false,
      instagram: '',
      website: '',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Lausanne',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // const MapSample()
            IconButton(
              onPressed: () {
                setState(() {
                  _youthGroups[0].isVisible = !_youthGroups[0].isVisible;
                });
                print(_youthGroups[0].isVisible);
              },
              icon: const Icon(Icons.location_pin),
            ),
            _youthGroups[0].isVisible
                ? YouthGroupCard(_youthGroups[0])
                : Text('nothing'),
            // MapSample(),


          ],
        ),
      ),
    );
  }
}
