import 'package:skillbox_12_8/data/api/api_model.dart';

class Settings {
  String? _remoteImageName;
  String get remoteImageName => _remoteImageName ?? ImageThemeName.animals;
  set remoteImageName(String value) {
    _remoteImageName = value;
  }
}
