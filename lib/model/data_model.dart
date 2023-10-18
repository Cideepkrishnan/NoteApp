import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final Color color;

  NoteModel({
    required this.color,
    required this.title,
    required this.description,
    required this.date,
  });

  void add(List<NoteModel> noteModel) {}
}

List<Color> color = [
  Color.fromARGB(255, 185, 34, 4),
  Color.fromARGB(255, 229, 245, 4),
  Color.fromARGB(255, 23, 232, 30),
  Color.fromARGB(255, 25, 198, 221),
  Color.fromARGB(255, 230, 140, 6),
  Color.fromARGB(255, 106, 60, 234)
];

List<NoteModel> noteModel = [];
