import 'city.dart';

class YouthGroup {
  final String name;
  final String who;
  final String church;
  // final City city;
  final String when;
  final String what;
  // final List<String> images;
  final String instagram;
  final String website;
  final String facebook;
  final String email;

  YouthGroup({
    required this.name,
    required this.who,
    // required this.city,
    required this.church,
    this.when = '',
    this.what = '',
    // this.images = '',
    this.instagram = '',
    this.website = '',
    this.facebook = '',
    this.email = '',
  });

  String getRouteName() {
    return '/${name.replaceAll(' ', '-').toLowerCase()}'; // e.g. 'Adoray Lausanne' -> '/adoray-lausanne'
  }
}
