import 'package:flutter/foundation.dart';
import 'package:skillbox_12_8/data/api/api_model.dart';
import 'package:skillbox_12_8/data/api/api_service_animals.dart';
import 'package:skillbox_12_8/data/api/api_service_nature.dart';
import 'package:skillbox_12_8/service_locator.dart';

class Settings extends ChangeNotifier {
  String? _remoteImageName;
  String? _url;
  String get url => _url ?? 'http://placeimg.com/640/480/animals';
  String get remoteImageName => _remoteImageName ?? ImageThemeName.animals;
  set remoteImageName(String value) {
    _remoteImageName = value;
  }

  void changeService(String value) {
    locator.unregister<APIService>();
    locator.registerSingleton<APIService>(value == ImageThemeName.animals
        ? APIServiceAnimals()
        : APIServiceNature());
    _url = locator.get<APIService>().fetchImage;
    notifyListeners();
  }
}
