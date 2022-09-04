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
    description:
        '''Majoritaiement des étudiants universitaires de l'EPFL, UNIL, HEC, et aussi des communautères de la communauté des Béatitudes ! ''',
    city: getCityByName('Lausanne'),
    images: [
      'assets/images/adoray-lausanne/adoray.jpg',
      'assets/images/adoray-lausanne/adoray2.jpg',
      'assets/images/adoray-lausanne/adoray3.jpg',
    ],
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
    what:
        '''Les Petits Artisans de François (PAF) est un groupe de jeune renanais qui a vu le jour quelques semaines après les JMJ de Cracovie en 2016 par des jeunes motivés de vivre, dans la paroisse de Renens des temps forts, conviviaux et solidaires, ayant, pour idéologie la prière tant connue de Saint François d’Assise, une prière de paix.''',
    church: 'Saint François d\'Assise, Renens',
    description: '''  ''',
    city: getCityByName('Lausanne'),
    images: [''],
    instagram: '',
    website: 'http://www.pasaj.ch/groupe-paf-petits-artisans-de-francois/',
    facebook: '',
    email: 'sebastien.gaspoz@gmail.com',
  )
];

YouthGroup getYouthGroupByName(String name) {
  for (var yg in youthGroups) {
    String normalizedName = yg.name.replaceAll(' ', '-').toLowerCase();
    if (name == normalizedName) {
      return yg;
    }
  }
  return YouthGroup(
      id: -1,
      name: 'error',
      description: 'description',
      city: City(id: -1, name: 'error', lat: 0, long: 0, zoom: 0),
      church: '',
      when: '',
      what: '',
      images: []);
}
