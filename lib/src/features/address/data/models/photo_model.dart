class Photo {
  final String id;
  final String title;
  final String imageUrl;
  final String authorName;
  final String description;

  Photo({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.description,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['alt_description'] ?? 'Untitled',
      imageUrl: json['urls']['small'],
      authorName: json['user']['name'],
      description: json['description'] ?? '',
    );
  }
}