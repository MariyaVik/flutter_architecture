import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillbox_12_8/data/api/api_model.dart';
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
    void _nextImage() {
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<Settings>(builder: (context, settings, child) {
            return MyImageWidget();
          }),
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
            children: const [
              Text('Выбери тему картинок'),
              SelectImageThemeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectImageThemeWidget extends StatefulWidget {
  const SelectImageThemeWidget({Key? key}) : super(key: key);

  @override
  State<SelectImageThemeWidget> createState() => _SelectImageThemeWidgetState();
}

class _SelectImageThemeWidgetState extends State<SelectImageThemeWidget> {
  @override
  Widget build(BuildContext context) {
    final settings = context.read<Settings>();

    void _changeValue(String? newValue) {
      if (newValue == null) return;
      settings.remoteImageName = newValue;
      settings.changeService(newValue);
      setState(() {});
    }

    return DropdownButton<String>(
      value: settings.remoteImageName,
      items: <String>[ImageThemeName.animals, ImageThemeName.nature]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: _changeValue,
    );
  }
}

class MyImageWidget extends StatelessWidget {
  MyImageWidget({Key? key}) : super(key: key);

  final imageTheme = locator.get<APIService>();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageTheme.fetchImage + "?v=${DateTime.now().millisecondsSinceEpoch}",
      loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress == null ? child : const CircularProgressIndicator(),
      errorBuilder: (context, error, stackTrace) =>
          const Image(image: AssetImage('assets/images/no_image.png')),
    );
  }
}
