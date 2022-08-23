
class City {
  final int id;
  final String name;
  final double lat;
  final double long;
  final double zoom;

  City({
    required this.id,
    required this.name,
    this.lat = -1,
    this.long = -1,
    this.zoom = -1,
  });
}
