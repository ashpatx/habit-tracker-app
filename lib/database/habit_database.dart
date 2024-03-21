import 'package:demoapp/models/app_settings.dart';
import 'package:demoapp/models/habit.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  /*
  Setup
  */

  //Initialize Database
  static Future<void> initialize() async {
    //ensure: to import path provider package
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [HabitSchema, AppSettingsSchema],
      directory: dir.path,
    );
  }

  //Create method to save first date of app startup for heatmap
  Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSettings()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  //Get first date of app startup for heatmap
  Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
  }
  /*
  Crud Operations
  */

  //List of Habits
  final List<Habit> currentHabit = [];

  //Create: Add a new habit
  Future<void> addHabit(String habitName) async {
    //create a new habit
    final newHabit = Habit()..name = habitName;
    //save habit to DB
    await isar.writeTxn(() => isar.habits.put(newHabit));
    //re-read from DB
    readHabits();
  }

  //Read: Read saved habits from DB
  Future<void> readHabits() async {
    //fetch all habits from DB
    List<Habit> fetchedHabits = await isar.habits.where().findAll();
    //give to current habits
    currentHabit.clear();
    currentHabit.addAll(fetchedHabits);
    //update UI
    notifyListeners();
  }

  //Update: Edit habit
  Future<void> updateHabitCompletion(int id, bool isCompleted) async {
    //find the specific habit
    final habit = await isar.habits.get(id);
    //update completion status 
    if (habit != null) {
      await isar.writeTxn(() async {
        
      }
    }
  }

  //Delete: Delete habit
}
