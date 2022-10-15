import 'package:flutter/material.dart';
import 'package:wefind/screens/group_form_screen.dart';

import '../widgets/youth_group_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../dummy_data.dart';
import '../models/youth_group.dart';
import '../models/city.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Stream<QuerySnapshot> youthGroups = FirebaseFirestore.instance
      .collection('/cities/lausanne/youth-groups')
      .snapshots(); // TODO need to adapt this to have one per city

  final Stream<QuerySnapshot> testCities = FirebaseFirestore.instance
      .collection('/cities').snapshots(); 

  int? _value = 0;
  // final List<YouthGroup> _ygs = youthGroups;
  City _chosenCity = getCityByName('Lausanne');

  // List<YouthGroupCard> getYouthGroupCards(City city) {
  //   List<YouthGroupCard> ygCards = [];
  //   for (var yg in _ygs) {
  //     if (yg.city == city) {
  //       ygCards.add(YouthGroupCard(yg));
  //     }
  //   }
  //   return ygCards;
  // }

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
                        // print(_chosenCity.name);                        
                      });
                    },
                  );
                }),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 700,
                child: StreamBuilder<QuerySnapshot>(
                  stream: youthGroups,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      Text('Something went wrong.');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }
                    final data = snapshot.requireData;
                    return ListView.builder(itemCount: data.size, itemBuilder: (context, index) {
                      String youthGroupName = data.docs[index]['name'];

                      // Create a YouthGroup object using the group ID 
                      
                      // --> maybe I can't do that. instead, pass all of the attributes to the
                      // youth group card, instead of passing a whole object
                      // Pass the object to YouthGroupCard
                      // ...
                      // Return YouthGroupCard
                      // ...
                      return Text('The name is ${data.docs[index]['name']}');
                    },);
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
