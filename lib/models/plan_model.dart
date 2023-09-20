class Plan
{
  final int id;
  final String duration;
  final String price;
  bool isSelected = false;


  Plan({
    required this.id,
    required this.duration,
    required this.price,
    this.isSelected = false,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      duration: json['duration'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'duration':duration,
      "price":price,
    };
  }


}