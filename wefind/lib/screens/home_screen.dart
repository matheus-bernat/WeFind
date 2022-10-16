import 'package:flutter/material.dart';
import 'package:wefind/screens/group_form_screen.dart';

import '../widgets/youth_group_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../dummy_data.dart';
import '../models/youth_group.dart';
import '../models/city.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<City>> citiesFuture;

  @override
  void initState() {
    super.initState();
    citiesFuture = getCities();
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
          TextButton(
            onPressed: () {
              goToGroupFormScreen(context);
            },
            child: Text('Nouveau groupe'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Sur nous'),
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
              child: FutureBuilder(
                  future: citiesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      final error = snapshot.error;
                      return Text('$error');
                    } else if (snapshot.hasData) {

                      List<City>? data = snapshot.data! as List<City>?;

                      return Wrap(
                        children: List<Widget>.generate(data!.length, (index) {
                          return ChoiceChip(
                            label: Text(
                              data[index].name,
                              style: theme.textTheme.bodyText1,
                            ),
                            selected: _value == index,
                            onSelected: (bool selected) {
                              setState(() {
                                _value = selected ? index : null;
                                // print(_chosenCity.name);
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
            // Expanded(
            //   child: SizedBox(
            //     width: 700,
            //     child: StreamBuilder<QuerySnapshot>(
            //       stream: youthGroups,
            //       builder: (BuildContext context,
            //           AsyncSnapshot<QuerySnapshot> snapshot) {
            //         if (snapshot.hasError) {
            //           Text('Something went wrong.');
            //         }
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return Text('Loading...');
            //         }
            //         final data = snapshot.requireData;
            //         return ListView.builder(
            //           itemCount: data.size,
            //           itemBuilder: (context, index) {
            //             // Create a YouthGroup object
            //             YouthGroup yg = YouthGroup(
            //               name: data.docs[index]['name'],
            //               church: data.docs[index]['church'],
            //               who: data.docs[index]['who'],
            //               when: data.docs[index]['when'],
            //             );
            //             return YouthGroupCard(yg);
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
