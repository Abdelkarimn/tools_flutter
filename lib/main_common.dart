import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_app.dart';

void mainCommon(String env) {
  late ThemeData _theme;

  switch (env) {
    case "dev":
      _theme = ThemeData(backgroundColor: Colors.red);
      break;
    case "loc":
      _theme = ThemeData(backgroundColor: Colors.green);
      break;
    case "prod":
      _theme = ThemeData(backgroundColor: Colors.blue);
      break;
    
  }
  runApp(Provider.value(value: _theme, child: MyApp()));
}
