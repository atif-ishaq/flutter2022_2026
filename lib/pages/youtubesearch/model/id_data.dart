class IdData {
  final String kind;
  final String? videoId;

  IdData({required this.kind, this.videoId});

  factory IdData.fromJson(Map<String, dynamic> json) {
    return IdData(
      kind: json['kind'] ?? '',
      videoId: json['videoId'],
    );
  }
}

// class IdData {
//   final String kind;
//   final String videoId;

//   IdData({required this.kind, required this.videoId});

//   factory IdData.fromJson(Map<String, dynamic> json) {
//     return IdData(
//       kind: json['kind'],
//       videoId: json['videoId'],
//     );
//   }
// }
