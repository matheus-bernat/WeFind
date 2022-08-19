import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:wefind/models/youth_group.dart';

class YouthGroupCard extends StatelessWidget {
  final YouthGroup youthGroup;

  // ignore: use_key_in_widget_constructors
  const YouthGroupCard(this.youthGroup);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.local_fire_department),
            title: Text(youthGroup.name,
                style: Theme.of(context).textTheme.headline6),
          ),
          Image.asset('assets/images/adoray2.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chip(
                avatar: const Icon(
                  Icons.access_time_sharp,
                  color: Colors.white,
                ),
                label: Text(
                  'Mercredi 19h30',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                backgroundColor: Theme.of(context).backgroundColor,
              ),
              Chip(
                avatar: const Icon(
                  Icons.local_fire_department_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  'Louange',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                backgroundColor: Theme.of(context).backgroundColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  // launchUrl(Uri.parse(widget.company.social_instagram.toString()));
                  // ignore: avoid_print
                  print('Insta pressed');
                },
                icon: const FaIcon(FontAwesomeIcons.instagram),
              ),
              IconButton(
                onPressed: () {
                  // ignore: avoid_print
                  print('Facebook pressed');
                },
                icon: const FaIcon(FontAwesomeIcons.facebook),
              )
            ],
          )
        ],
      ),
    );
  }
}
