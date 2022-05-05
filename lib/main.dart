import 'package:flutter/material.dart';
import 'package:usefull_widgets/config/theme.dart';
import 'package:usefull_widgets/view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
