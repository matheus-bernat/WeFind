import 'city.dart';

class YouthGroup {
  final int id;
  final String name;
  final String description;
  final String church;
  final String when;
  final String what;
  final String imagesAddress;
  final City city;
  final double lat;
  final double long;
  final String instagram;
  final String website;
  final String facebook;
  final String email;
  bool isVisible;

  YouthGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.church,
    required this.when,
    required this.what,
    this.imagesAddress = '',
    this.isVisible = false,
    this.lat = -1,
    this.long = -1,
    this.instagram = '',
    this.website = '',
    this.facebook = '',
    this.email = '',
  });
}
