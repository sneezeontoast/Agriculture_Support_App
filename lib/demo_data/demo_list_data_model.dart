class DemoListItem {
  final String image;
  final String title;
  final String details;

  DemoListItem({required this.image, required this.title, required this.details});

  factory DemoListItem.fromJson(Map<String, dynamic> json) {
    return DemoListItem(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      details: json['details'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'details': details,
    };
  }
}
