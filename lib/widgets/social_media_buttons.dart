import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

import 'package:wefind/models/youth_group.dart';

class SocialMediaButtons extends StatelessWidget {
  final YouthGroup youthGroup;

  const SocialMediaButtons(this.youthGroup);



  Future openEmailApp(String email) async {
    final String subject = '';
    final String message = '';
    final url = 'mailto:$email?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
    var urlParsed = Uri.parse(url);
    if (await canLaunchUrl(urlParsed)) {
      await launchUrl(urlParsed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        youthGroup.instagram != ''
            ? IconButton(
                tooltip: 'Instagram',
                splashRadius: 20,
                onPressed: () {
                  html.window.open(youthGroup.instagram, '_blank');
                },
                icon: const FaIcon(FontAwesomeIcons.instagram),
              )
            : Container(),
        youthGroup.facebook != ''
            ? IconButton(
                tooltip: 'Facebook',
                splashRadius: 20,
                onPressed: () {
                  html.window.open(youthGroup.facebook, '_blank');
                },
                icon: const FaIcon(FontAwesomeIcons.facebook),
              )
            : Container(),
        youthGroup.email != ''
            ? IconButton(
                tooltip: 'Email',
                splashRadius: 20,
                onPressed: () {
                  openEmailApp(youthGroup.email);
                },
                icon: const FaIcon(FontAwesomeIcons.envelope),
              )
            : Container(),
        youthGroup.website != ''
            ? IconButton(
                tooltip: 'Website',
                splashRadius: 20,
                onPressed: () {
                  html.window.open(youthGroup.website, '_blank');
                },
                icon: const FaIcon(FontAwesomeIcons.globe),
              )
            : Container(),
      ],
    );
  }
}
