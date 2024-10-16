import 'package:hive/hive.dart';
part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  bool isFav;

  @HiveField(4)
  String date;

  @HiveField(5)
  String time;

  NoteModel(
      this.id, this.title, this.description, this.isFav, this.date, this.time);
}
