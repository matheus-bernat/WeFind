import 'package:flutter/material.dart';
import 'package:wefind/widgets/map_sample.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WeFind'),
        ),
        body: Stack(
          children: [
            MapSample(),
            
          ],
        ));
  }
}
