import 'package:isar/isar.dart';

//g stands for generate, run cmd to generate file: dart run build_runner build
part 'app_settings.g.dart'; //this file is to save objects in our db

@Collection()
class AppSettings {
  Id id = Isar.autoIncrement;
  DateTime? firstLaunchDate;
}
