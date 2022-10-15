import 'package:flutter/material.dart';

class GroupFormScreen extends StatefulWidget {
  static const routeName = '/enregistrement';

  @override
  State<GroupFormScreen> createState() {
    return _GroupFormScreenState();
  }
}

class _GroupFormScreenState extends State<GroupFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _citiesList = [
    'Lausanne',
    'Geneva',
    'Lucerne'
  ]; // TODO: get this from Firestore. All cities in Switzerland? Or just the biggest ones?
  String? _selectedCity;

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {});
    }
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Svp donnez le nom de votre groupe de prière !';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Nom du groupe'),
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(labelText: 'Ville'),
                      value: _selectedCity,
                      items: _citiesList
                          .map((val) => DropdownMenuItem(
                                child: Text(val),
                                value: val,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedCity = val as String;
                        });
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Église/paroisse'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
