import 'dart:convert';

import 'package:bareq/Models/level_free_lesson_model.dart';
import 'package:bareq/Models/unit_model.dart';

class Lesson
{
  int? id;
  String? arname;
  String? enname;
  String? image;
  String? type;
  int? sort;
  int? free;
  int? elementsCount;
  String? unitTest;
  LevelFreeLesson? level;
  int? checked;
  String? lock;

  Lesson(
  {
     this.id,
     this.arname,
     this.enname,
     this.image,
     this.type,
     this.sort,
     this.free,
     this.elementsCount,
     this.checked,
     this.lock,
     this.level,
     this.unitTest
  }
  );

  factory Lesson.fromJson(Map<String, dynamic> json)
  {
    return Lesson(
        id: json['id'],
        arname: json['arname'],
        enname: json['enname'],
        image: json['image'],
        type: json['type'],
        sort: json['sort'],
        free: json['free'],
        elementsCount: json['elementsCount'],
        checked: json['checked'],
        lock: json['lock'],
        unitTest: json['unit'] != null ? json['unit']["unitTest"] : null,
        level: json['level'] != null ? LevelFreeLesson.fromJson(json['level']) : null,
    );
  }
}