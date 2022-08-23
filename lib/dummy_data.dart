import 'models/youth_group.dart';
import 'models/city.dart';

final List<City> cities = [
  City(
    id: 0,
    name: 'Lausanne',
    lat: 46.518708,
    long: 6.6097896,
    zoom: 12.97,
  ),
  City(
    id: 1,
    name: 'Genève',
    lat: 46.518708,
    long: 6.6097896,
    zoom: 12.97,
  ),
];

City getCityByName(String name) {
    for (var city in cities) {
      if (city.name == name) {
        return city;
      }
    }
    return City(id: -1, name: 'error', lat: 0, long: 0, zoom: 0);
  }

  City getCityById(int id) {
    return cities[id];
  }

final List<YouthGroup> youthGroups = [
  YouthGroup(
    id: 0,
    name: 'Adoray Lausanne',
    church: 'Saint Thérèse',
    when: 'Tous les mercredis soir à 19h30',
    what: 'Louange, enseignement, adoration fini par une bière',
    description: '''À leur retour des JMJ 2016 à Cracovie, trois amis décidèrent de se rencontrer chaque mercredi pour louer le Seigneur et souper ensemble. Ils baptisèrent ce groupe «La Dalle Spirituelle» pour signifier leur faim et leur soif du Christ.''',
    city: getCityByName('Lausanne'),
    imagesAddress: 'assets/images/adoray2.jpg',
    lat: 46.5198611,
    long: 6.6094059,
    instagram: 'https://www.instagram.com/adoraylausanne/',
    website: 'https://www.adoray.ch/orte/lausanne/',
  ),
  YouthGroup(
    id: 1,
    name: 'VAF',
    when: 'Une fois par mois (date variable), 19h-21h30',
    what: 'Temps d\'enseignement et de partage précédé d\'un repas.',
    church: 'Saint François d\'Assise, Renens',
    description: '''  ''',
    city: getCityByName('Lausanne'),
    instagram: '',
    website: '',
  )
];
