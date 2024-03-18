import 'dart:js';

import 'package:demoapp/pages/theme/theme_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifier(
    create: (context) => ThemeProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Root of App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
