import 'package:skillbox_12_8/data/api/api_model.dart';
import 'package:skillbox_12_8/data/api/api_service_animals.dart';
import 'package:skillbox_12_8/data/api/api_service_nature.dart';
import 'package:skillbox_12_8/service_locator.dart';

class Settings {
  String? _remoteImageName;
  String get remoteImageName => _remoteImageName ?? ImageThemeName.animals;
  set remoteImageName(String value) {
    _remoteImageName = value;
  }

  void changeService(String value) {
    locator.unregister<APIService>();
    locator.registerSingleton<APIService>(
        _remoteImageName == ImageThemeName.animals
            ? APIServiceAnimals()
            : APIServiceNature());
  }
}
