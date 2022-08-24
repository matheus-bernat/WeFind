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
    facebook: 'https://www.facebook.com/AdorayLausanne',
    email: 'lausanne@adoray.ch',
  ),
  YouthGroup(
    id: 1,
    name: 'PAF',
    when: 'Une fois par mois (date variable), 19h-21h30',
    what: '''Les Petits Artisans de François (PAF) est un groupe de jeune renanais qui a vu le jour quelques semaines après les JMJ de Cracovie en 2016 par des jeunes motivés de vivre, dans la paroisse de Renens des temps forts, conviviaux et solidaires, ayant, pour idéologie la prière tant connue de Saint François d’Assise, une prière de paix.''',
    church: 'Saint François d\'Assise, Renens',
    description: '''  ''',
    city: getCityByName('Lausanne'),
    instagram: '',
    website: 'http://www.pasaj.ch/groupe-paf-petits-artisans-de-francois/',
    facebook: '',
    email: 'sebastien.gaspoz@gmail.com',
  )
];
