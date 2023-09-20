class Unit
{
  final int? id;
  final String? arname;
  final String? enname;
  final String? image;
  final int? sort;
  final int? lessonCount;

  Unit(
  {
     this.id,
     this.arname,
     this.enname,
     this.image,
     this.sort,
     this.lessonCount,
});

  factory Unit.fromJson(Map<String, dynamic> json)
  {
    return Unit(
      id: json['id'],
      arname: json['arname'],
      enname: json['enname'],
      image: json['image'],
      sort: json['sort'],
      lessonCount: json['lessonCount'],
    );
  }
}