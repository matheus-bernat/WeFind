import 'package:flutter/material.dart';

import '../models/youth_group.dart';
import '../dummy_data.dart';
import '../widgets/image_carousel.dart';
import '../widgets/social_media_buttons.dart';

class YouthGroupScreen extends StatelessWidget {
  String youthGroupName;
  YouthGroupScreen(this.youthGroupName);

  late final YouthGroup _youthGroup = getYouthGroupByName(youthGroupName);

  @override
  Widget build(BuildContext context) {
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
          child: SizedBox(
            width: 700,
            child: SingleChildScrollView(
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _youthGroup.name,
                              style: theme.textTheme.headline2,
                            ),
                            SocialMediaButtons(_youthGroup),
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
                        child: Text(_youthGroup.church,
                            style: theme.textTheme.bodyText1),
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
                        child: Text(_youthGroup.when,
                            style: theme.textTheme.bodyText1),
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
                        child: Text(_youthGroup.what,
                            style: theme.textTheme.bodyText1),
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
                          _youthGroup.description,
                          style: theme.textTheme.bodyText1,
                        ),
                      ),
                      ImageCarousel(_youthGroup),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
