import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillbox_12_8/domain/settings.dart';
import 'package:skillbox_12_8/ui/widgets/screen_image.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Settings(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScreenImage(),
      ),
    );
  }
}
