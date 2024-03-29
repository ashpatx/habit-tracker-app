import 'package:demoapp/database/habit_database.dart';
import 'package:demoapp/pages/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize DB as an async function
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();

  runApp(
    //multiple providers for DB and theme
    MultiProvider(
      providers: [
        //DB
        ChangeNotifierProvider(create: (context) => HabitDatabase()),

        //theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const myApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Root of App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
