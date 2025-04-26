class ThumbnailData {
  final String url;
  final int? width;
  final int? height;

  ThumbnailData({
    required this.url,
    this.width,
    this.height,
  });

  factory ThumbnailData.fromJson(Map<String, dynamic> json) {
    return ThumbnailData(
      url: json['url'] ?? '',
      width: json['width'] != null ? json['width'] as int : null,
      height: json['height'] != null ? json['height'] as int : null,
    );
  }
}

// class ThumbnailData {
//   final String url;
//   final int width;
//   final int height;

//   ThumbnailData({
//     required this.url,
//     required this.height,
//     required this.width,
//   });

//   factory ThumbnailData.fromJson(Map<String, dynamic> json) {
//     return ThumbnailData(
//       url: json['url'],
//       height: json['height'],
//       width: json['width'],
//     );
//   }
// }
