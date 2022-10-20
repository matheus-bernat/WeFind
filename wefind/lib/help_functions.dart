String normalizeCityName(String? cityName) {
  print('this is selectedCity: $cityName');
  String docName = '';

  switch (cityName) {
    case 'Lausanne':
      {
        docName = 'lausanne';
      }
      break;
    case 'Genève':
      {
        docName = 'geneva';
      }
      break;
    case 'Lucerne':
      {
        docName = 'lucerne';
      }
      break;
    case 'Zürich':
      {
        docName = 'zurich';
      }
      break;
    case 'Bern':
      {
        docName = 'bern';
      }
      break;
    case 'Fribourg':
      {
        docName = 'fribourg';
      }
      break;
    default:
      {
        docName = 'other-city';
      }
  }
  print('docname is $docName');
  return docName;
}

// String getField(String fieldName, ) {

// }