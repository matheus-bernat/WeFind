import 'city.dart';

class YouthGroup {
  String name;
  String who;
  String church;
  // final City city;
  String when;
  String what;
  // final List<String> images;
  String instagram;
  String googleMapsLink;
  String website;
  String facebook;
  String email;

  YouthGroup({
    required this.name,
    required this.who,
    // required this.city,
    required this.church,
    required this.when,
    required this.what,
    required this.googleMapsLink,
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
