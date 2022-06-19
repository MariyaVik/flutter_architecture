import 'package:flutter/material.dart';
import 'package:skillbox_12_8/data/api/api_model.dart';
import 'package:skillbox_12_8/data/api/api_service_animals.dart';
import 'package:skillbox_12_8/data/api/api_service_nature.dart';
import 'package:skillbox_12_8/domain/settings.dart';
import 'package:skillbox_12_8/service_locator.dart';

class ScreenImage extends StatefulWidget {
  const ScreenImage({Key? key}) : super(key: key);

  @override
  State<ScreenImage> createState() => _ScreenImageState();
}

class _ScreenImageState extends State<ScreenImage> {
  @override
  Widget build(BuildContext context) {
    final imageTheme = locator.get<APIService>();

    final settings = locator.get<Settings>();
    String dropdownValue = settings.remoteImageName;

    void _changeValue(String? newValue) {
      if (newValue == null) return;
      dropdownValue = newValue;
      settings.remoteImageName = newValue;
      locator.unregister<APIService>();
      locator.registerSingleton<APIService>(
          settings.remoteImageName == ImageThemeName.animals
              ? APIServiceAnimals()
              : APIServiceNature());
      setState(() {});
    }

    void _nextImage() {
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            imageTheme.fetchImage,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const CircularProgressIndicator(),
            errorBuilder: (context, error, stackTrace) =>
                const Image(image: AssetImage('assets/images/no_image.png')),
          ),
          ElevatedButton(
            onPressed: _nextImage,
            child: const Text('Дальше'),
          )
        ],
      )),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Выбери тему картинок'),
              DropdownButton<String>(
                value: dropdownValue,
                items: <String>[ImageThemeName.animals, ImageThemeName.nature]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: _changeValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SelectImageThemeWidget extends StatefulWidget {
//   const SelectImageThemeWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<SelectImageThemeWidget> createState() => _SelectImageThemeWidgetState();
// }

// class _SelectImageThemeWidgetState extends State<SelectImageThemeWidget> {
//   String dropdownValue = 'Животные';

//   Settings get settings => locator.get<Settings>();

//   void _changeValue(String? newValue) {
//     if (newValue == null) return;
//     dropdownValue = newValue;
//     settings.remoteImageName = newValue;
//     locator.unregister<APIService>();
//     locator.registerSingleton<APIService>(
//         settings.remoteImageName == ImageThemeName.animals
//             ? APIServiceAnimals()
//             : APIServiceNature());
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       items: <String>[ImageThemeName.animals, ImageThemeName.nature]
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: _changeValue,
//     );
//   }
// }
