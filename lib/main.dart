import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_isekai/home.dart';

import 'package:my_isekai/services/state_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StateWidget stateWidget = new StateWidget(
    child: new MyApp(),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    runApp(stateWidget);
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MyIsekai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SAO'),
      // home: HomePage(),
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}
