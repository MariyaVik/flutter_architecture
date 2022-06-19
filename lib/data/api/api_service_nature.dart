import 'package:skillbox_12_8/data/api/api_model.dart';

class APIServiceNature implements APIService {
  @override
  String get nameImageTheme => ImageThemeName.nature;
  @override
  String get fetchImage => 'http://placeimg.com/640/480/nature';
}
