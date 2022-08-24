import 'package:flutter/material.dart';
import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:wefind/models/youth_group.dart';
import 'package:wefind/widgets/social_media_buttons.dart';

class YouthGroupCard extends StatelessWidget {
  final YouthGroup youthGroup;

  // ignore: use_key_in_widget_constructors
  const YouthGroupCard(this.youthGroup);

  Image getImage(String imageAddress) {
    return Image.asset(youthGroup.imagesAddress);
  }

  @override
  Widget build(BuildContext context) {
    getImage(youthGroup.imagesAddress);

    var screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    youthGroup.name,
                    style: theme.textTheme.headline2,
                  ),
                  SocialMediaButtons(youthGroup)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ÉGLISE',
                style: theme.textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(youthGroup.church, style: theme.textTheme.bodyText1),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'QUAND',
                style: theme.textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(youthGroup.when, style: theme.textTheme.bodyText1),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'QUOI',
                style: theme.textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(youthGroup.what, style: theme.textTheme.bodyText1),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'QUI SOMMES NOUS',
                style: theme.textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                youthGroup.description,
                style: theme.textTheme.bodyText1,
              ),
            ),
            youthGroup.imagesAddress.isNotEmpty
                ? Center(child: getImage(youthGroup.imagesAddress))
                : Container(),
          ],
        ),
      ),
    );
  }
}
