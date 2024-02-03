class DemoListItem {
  final String image;
  final String title;
  final String details;
  final String route;

  DemoListItem({required this.image, required this.title, required this.details, required this.route});

  factory DemoListItem.fromJson(Map<String, dynamic> json) {
    return DemoListItem(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      details: json['details'] ?? '',
      route: json['route'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'details': details,
      'route': route,
    };
  }
}
