class Level
{
  int? id;
  String? arname;
  String? enname;
  int? sort;
  int? free;
  int? unitsCount;
  String? image;
  String? type;
  String? percentage;
  int? hasReport;
  int? progress;
  String? hasSolveQuiz;
  String? levelTest;

  Level(
      {
         this.id,
         this.arname,
         this.enname,
         this.sort,
         this.free,
         this.unitsCount,
         this.image,
         this.type,
         this.percentage,
         this.hasReport,
         this.hasSolveQuiz,
         this.levelTest,
         this.progress
      });

  factory Level.fromJson(Map<String, dynamic> json)
  {
    return Level(
      id: json['id'],
      arname: json['arname'],
      enname: json['enname'],
      image: json['image'],
      sort: json['sort'],
      free: json['free'],
      unitsCount: json['unitsCount'],
      type: json['type'],
      percentage: json['percentage'],
      hasReport: json['has_report'],
      hasSolveQuiz: json['has_solve_quiz'],
      levelTest: json['levelTest'],
      progress: json['progress'],
    );
  }
}