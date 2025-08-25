class NewsPost {
  final String? imagePath;
  final String mainText;
  final String? describtionText;
  final String url;
  final String publishedDate;
  NewsPost({
    required this.imagePath,
    required this.mainText,
    required this.describtionText,
    required this.url,
    required this.publishedDate,
  });
  factory NewsPost.fromJson(json) {
    return  NewsPost(
          mainText: json['title'],
          describtionText: json['description'],
          imagePath: json['urlToImage'],
          url: json['url'],
          publishedDate: json['publishedAt']
        );
  }
}
