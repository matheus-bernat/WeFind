import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:wefind/models/youth_group.dart';

class YouthGroupCard extends StatelessWidget {
  final YouthGroup youthGroup;

  YouthGroupCard(this.youthGroup);

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
                  print('Insta pressed');
                },
                icon: const FaIcon(FontAwesomeIcons.instagram),
              ),
              IconButton(
                onPressed: () {
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
