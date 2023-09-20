class ElementModel
{
  int id;
  String arName;
  String enName;
  int sort;
  int show;
  File file;
  int type;
  String logo;
  bool clicked;
  String clickedDate;

  ElementModel(
      {
        required this.id,
        required this.arName,
        required this.enName,
        required this.logo,
        required this.type,
        required this.sort,
        required this.show,
        required this.file,
        required this.clicked,
        required this.clickedDate,
      }
      );

  factory ElementModel.fromJson(Map<String, dynamic> json)
  {
    return ElementModel(
      id: json['id'],
      arName: json['arName'],
      enName: json['enName'],
      logo: json['logo'],
      type: json['type'],
      sort: json['sort'] ?? 0,
      show: json['show'],
      clicked: json['clicked'],
      clickedDate: json['clicked_date'],
      file: File.fromJson(json['file']),
    );
  }
}

class File
{
  int id;
  String name;
  String path;
  String fileType;

  File(
      {
        required this.id,
        required this.name,
        required this.path,
        required this.fileType,
      });

  factory File.fromJson(Map<String, dynamic> json)
  {
    return File(
      id: json['id'],
      name: json['name'] ?? "",
      path: json['path'],
      fileType: json['fileType'].toString(),
    );
  }
}