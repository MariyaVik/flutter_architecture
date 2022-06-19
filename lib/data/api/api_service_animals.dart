import 'package:skillbox_12_8/data/api/api_model.dart';

class APIServiceAnimals implements APIService {
  @override
  String get nameImageTheme => ImageThemeName.animals;

  @override
  String get fetchImage => 'http://placeimg.com/640/480/animals';
}
