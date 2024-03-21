import 'package:isar/isar.dart';

//g stands for generate, run cmd to generate file: dart run build_runner build
part 'habit.g.dart'; //this file is to save objects in our db

@Collection() //collection tag
class Habit {
  //habit ID
  Id id = Isar.autoIncrement;

  //habit name
  late String name;

  //completed days
  List<DateTime> completedDays = [
    //DateTime(2024,3,1),
    //DateTime(2024,3,2),
  ];
}
