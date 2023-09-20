import 'package:bareq/Models/level_model.dart';
import 'package:bareq/Models/unit_model.dart';
import 'package:bareq/models/lesson_model.dart';

class UserStudy{
  final int? userId;
  final String? percentage;
  final StartPoint? startPoint;
  final CurrentLevel? currentLevel;

  UserStudy({
     this.userId,
     this.percentage,
     this.startPoint,
     this.currentLevel,
  });

  factory UserStudy.fromJson(Map<String, dynamic> json) {
    return UserStudy(
      userId: json['user_id'],
      percentage: json['percentage'] ?? "",
      startPoint: StartPoint.fromJson(json['start_point']),
      currentLevel: CurrentLevel.fromJson(json['current_level']),
    );
  }




}

class StartPoint
{
  final Level? level;
  final Unit? unit;
  final Lesson? lesson;


  StartPoint({
   this.level,
   this.unit,
   this.lesson,
});

factory StartPoint.fromJson(Map<String, dynamic> json) {
  return StartPoint(
  level: Level.fromJson(json['level']),
  unit: Unit.fromJson(json['unit']),
  lesson: Lesson.fromJson(json['lesson']),
   );
  }

}

class CurrentLevel
{
final Level? level;
final Unit? unit;
final Lesson? lesson;


CurrentLevel({
this.level,
this.unit,
this.lesson,
});

factory CurrentLevel.fromJson(Map<String, dynamic> json) {
return CurrentLevel(
level: Level.fromJson(json['level']),
unit: Unit.fromJson(json['unit']),
lesson: Lesson.fromJson(json['lesson']),
);
}

}