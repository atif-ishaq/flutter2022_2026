class ThumbnailData {
  final String url;
  final int width;
  final int height;

  ThumbnailData({
    required this.url,
    required this.height,
    required this.width,
  });

  factory ThumbnailData.fromJson(Map<String, dynamic> json) {
    return ThumbnailData(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }
}
