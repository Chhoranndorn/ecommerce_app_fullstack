class Banner {
  final int id;
  final String title;
  final String image;
  final String? link;

  Banner({
    required this.id,
    required this.title,
    required this.image,
    this.link,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      link: json['link'],
    );
  }
}
