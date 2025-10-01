class Special {
  final int id;
  final String name;
  final String image;

  Special({required this.id, required this.name, required this.image});

  factory Special.fromJson(Map<String, dynamic> json){
    return Special(id: json['id'], name:json['name'],image: json['image'],);
  }
}
