import 'package:flutter/material.dart';
import 'package:wefind/screens/group_form_screen.dart';

import '../help_functions.dart';
import '../widgets/youth_group_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../dummy_data.dart';
import '../models/youth_group.dart';
import '../models/city.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<City>> citiesFuture;
  late Future<List<YouthGroup>> ygsFuture;
  String chosenCityName = '';

  @override
  void initState() {
    super.initState();
    citiesFuture = getCities();
  }

  Future<List<YouthGroup>> getYgs(String cityName) async {
    String docName = normalizeCityName(cityName);

    final ygsRef = FirebaseFirestore.instance
        .collection('cities')
        .doc(docName)
        .collection('youth-groups');
    QuerySnapshot querySnapshot = await ygsRef.get();
    List<YouthGroup> ygs = [];

    for (var doc in querySnapshot.docs) {
      print(doc.data());
      YouthGroup yg = YouthGroup(
        name: doc.get('name'),
        church: doc.get('church'),
        who: doc.get('who'),
        when: doc.get('when'),
        what: doc.get('what'),
        googleMapsLink: doc.get('googleMapsLink'),
        // website: doc.get('website'),
        // instagram: doc.get('instagram'),
        // facebook: doc.get('facebook'),
        // email: doc.get('email'),
      );

      ygs.add(yg);
    }
    return ygs;
  }

  Future<List<City>> getCities() async {
    final citiesRef = FirebaseFirestore.instance.collection('cities');
    QuerySnapshot querySnapshot = await citiesRef.get();
    List<City> cities = [];
    for (var doc in querySnapshot.docs) {
      City newCity = City(name: doc.get('name'));
      cities.add(newCity);
    }
    return cities;
  }

  int? _value = 0;

  void goToGroupFormScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(GroupFormScreen.routeName);
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
        actions: [
          // TextButton(
          //   onPressed: () {
          //     goToGroupFormScreen(context);
          //   },
          //   style: ButtonStyle(
          //       foregroundColor:
          //           MaterialStateProperty.all(theme.indicatorColor)),
          //   child: Text(
          //     'Nouveau groupe',
          //     style: theme.textTheme.bodyLarge,
          //   ),
          // ),
          IconButton(
            onPressed: () {
              goToGroupFormScreen(context);
            },
            icon: Icon(
              Icons.add,
              size: 25,
            ),
            splashRadius: 20,
          ),
        ],
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
              // helpful: https://www.youtube.com/watch?v=lkpPg0ieklg
              child: FutureBuilder<List<City>>(
                  future: citiesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      final error = snapshot.error;
                      return Text('$error');
                    } else if (snapshot.hasData) {
                      List<City> data = snapshot.data!;

                      return Wrap(
                        children: List<Widget>.generate(data.length, (index) {
                          return ChoiceChip(
                            label: Text(
                              data[index].name,
                              style: theme.textTheme.bodyText1,
                            ),
                            selected: _value == index,
                            onSelected: (bool selected) {
                              setState(() {
                                _value = selected ? index : null;
                                chosenCityName = data[index].name;
                              });
                            },
                          );
                        }),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
            Expanded(
              child: SizedBox(
                width: 700,
                child: FutureBuilder<List<YouthGroup>>(
                  future: getYgs(chosenCityName),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<YouthGroup> data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return YouthGroupCard(data[index]);
                        },
                      );
                    } else {
                      return Text('No ygs to show');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
