class LevelFreeLesson
{
  int id;
  String arname;
  String enname;
  String image;

  LevelFreeLesson(
      {
        required this.id,
        required this.arname,
        required this.enname,
        required this.image,
      });

  factory LevelFreeLesson.fromJson(Map<String, dynamic> json)
  {
    return LevelFreeLesson(
      id: json['id'],
      arname: json['arname'],
      enname: json['enname'],
      image: json['image'],
    );
  }
}