import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:wefind/models/youth_group.dart';
import 'package:wefind/screens/youth_group_screen.dart';
import 'package:wefind/widgets/image_carousel.dart';
import 'package:wefind/widgets/social_media_buttons.dart';

class YouthGroupCard extends StatelessWidget {
  final YouthGroup youthGroup;

  // ignore: use_key_in_widget_constructors
  const YouthGroupCard(this.youthGroup);

  void selectYouthGroup(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      youthGroup.getRouteName(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      selectYouthGroup(context);
                    },
                    child: Text(
                      youthGroup.name,
                      style: theme.textTheme.headline2,
                    ),
                  ),
                  SocialMediaButtons(youthGroup),
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
            ImageCarousel(youthGroup),
          ],
        ),
      ),
    );
  }
}
