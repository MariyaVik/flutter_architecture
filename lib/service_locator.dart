import 'package:get_it/get_it.dart';
import 'package:skillbox_12_8/data/api/api_model.dart';
import 'package:skillbox_12_8/data/api/api_service_animals.dart';
import 'package:skillbox_12_8/data/api/api_service_nature.dart';
import 'package:skillbox_12_8/domain/settings.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  final settings = Settings();
  locator.registerSingleton<APIService>(
      settings.remoteImageName == ImageThemeName.animals
          ? APIServiceAnimals()
          : APIServiceNature());
}
