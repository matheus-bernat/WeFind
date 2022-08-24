import 'package:flutter/material.dart';
import 'package:wefind/models/youth_group.dart';

import 'package:wefind/widgets/youth_group_card.dart';
import '../dummy_data.dart';
import '../models/city.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _value = 0;
  // final List<String> cities = ['Lausanne', 'Genève', 'Fribourg'];
  final List<YouthGroup> _ygs = youthGroups;
  City _chosenCity = getCityByName('Lausanne');

  List<YouthGroupCard> getYouthGroupCards(City city) {
    List<YouthGroupCard> ygCards = [];
    for (var yg in _ygs) {
      if (yg.city == city) {
        ygCards.add(YouthGroupCard(yg));
      }
    }
    return ygCards;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 60,
          child: Image.asset(
            'assets/images/wefind-white.png',
          ),
        ),
      ),
      body: Container(
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Trouves un groupe de prière étudiant catholique en Suisse !',
                style: theme.textTheme.headline3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Wrap(
                children: List<Widget>.generate(cities.length, (index) {
                  return ChoiceChip(
                    label: Text(
                      getCityById(index).name,
                      style: theme.textTheme.bodyText1,
                    ),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                        _chosenCity = getCityById(index);
                      });
                    },
                  );
                }),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 600,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: getYouthGroupCards(_chosenCity),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
