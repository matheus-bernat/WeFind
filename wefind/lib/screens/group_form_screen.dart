import 'package:flutter/material.dart';
import 'package:wefind/help_functions.dart';
import 'package:wefind/models/youth_group.dart';
import 'package:wefind/screens/home_screen.dart';
import '../models/city.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupFormScreen extends StatefulWidget {
  static const routeName = '/enregistrement';

  @override
  State<GroupFormScreen> createState() {
    return _GroupFormScreenState();
  }
}

class _GroupFormScreenState extends State<GroupFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Future<List<City>> citiesFuture;
  String? _selectedCity;

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

  Future<void> createYouthGroup({required YouthGroup yg}) async {
    String docName = normalizeCityName(_selectedCity);

    final ygsRef = FirebaseFirestore.instance
        .collection('cities')
        .doc(docName)
        .collection('youth-groups')
        .doc(yg.name);
    await ygsRef.set({
      'name': yg.name,
      'who': yg.who,
      'church': yg.church,
      'when': yg.when,
      'what': yg.what,
      'instagram': yg.instagram,
      'googleMapsLink': yg.googleMapsLink,
      'website': yg.website,
      'email': yg.email,
    });
    return;
  }

  void navigateToHomeScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    YouthGroup newYouthGroup = YouthGroup(church: '', name: '', who: '', when: '', what: '', googleMapsLink: '');

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 60,
          child: Image.asset(
            'assets/images/wefind-white.png',
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SizedBox(
            width: 700,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Enregistre un nouveau groupe de jeune :',
                style: theme.textTheme.headline3,
              ),
              Text(
                "En tant que leader d'un groupe de prière pour les jeunes vous pouvez enregistrer le groupe. Remplissez les données en bas.",
                style: theme.textTheme.bodyLarge,
              ),
              Form(
                key: _formKey,
                child: FutureBuilder<List<City>>(
                    future: citiesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<City> listOfCities = snapshot.data!;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // NAME OF THE GROUP
                            TextFormField(
                              onSaved: (val) {
                                newYouthGroup.name = val!;
                              },
                              autofocus: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Svp donnez le nom de votre groupe de prière !';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Nom du groupe'),
                            ),

                            // CITY
                            DropdownButtonFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Ville'),
                              value: _selectedCity,
                              items: listOfCities
                                  .map((val) => DropdownMenuItem(
                                        child: Text(val.name),
                                        value: val.name,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selectedCity = val as String;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Svp choisis en quelle ville vous êtes.';
                                }
                                return null;
                              },
                            ),

                            // WHO
                            TextFormField(
                              onSaved: (val) {
                                newYouthGroup.who = val!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Svp dis-nous qui vous êtes';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText:
                                      "Qui êtes vous ? Tranche d'age, jeunes pros, étudiants..."),
                            ),

                            // WHERE
                            TextFormField(
                              onSaved: (val) {
                                newYouthGroup.church = val!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Svp donnes-nous le nom de la paroisse à la quelle vous êtes liés !';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Adresse / nom de la paroisse'),
                            ),

                            // GOOGLE MAPS ADDRESS
                            TextFormField(
                              onSaved: (val) {
                                newYouthGroup.googleMapsLink = val!;
                                print('saved the googlemapslink: ${newYouthGroup.googleMapsLink}');
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Svp donnes-nous l'adresse sur Google maps !";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Lien Google Maps'),
                            ),

                            // WHEN
                            TextFormField(
                              onSaved: (val) {
                                newYouthGroup.when = val!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Svp dites-nous quand vous vous rencontrez !';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText:
                                      "Quand"),
                            ),

                            // WHAT
                            TextFormField(
                              onSaved: (val) {
                                newYouthGroup.what = val!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Svp dites-nous ce que vous faites à vos activités !';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: "Qu'est-ce que vous faites ?"),
                            ),
                          ],
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      createYouthGroup(yg: newYouthGroup);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Enregistrement envoyé !')),
                      );
                      navigateToHomeScreen(context);
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
