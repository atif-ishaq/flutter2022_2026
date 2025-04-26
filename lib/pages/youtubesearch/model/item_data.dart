import 'id_data.dart';
import 'snippet_data.dart';

class ItemData {
  final String? kind;
  final String? etag;
  final IdData? id;
  final SnippetData? snippet;

  ItemData({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      id: json['id'] != null ? IdData.fromJson(json['id']) : null,
      snippet: json['snippet'] != null
          ? SnippetData.fromJson(json['snippet'])
          : null,
    );
  }
}

// import 'package:mad_2022_26/pages/youtubesearch/model/id_data.dart';
// import 'package:mad_2022_26/pages/youtubesearch/model/snippet_data.dart';

// class ItemData {
//   final String kind;
//   final String etag;
//   final IdData id;
//   final SnippetData snippet;

//   ItemData({
//     required this.kind,
//     required this.etag,
//     required this.id,
//     required this.snippet,
//   });

//   factory ItemData.fromJson(Map<String, dynamic> json) {
//     return ItemData(
//       kind: json['kind'],
//       etag: json['etag'],
//       id: IdData.fromJson(json['id']),
//       snippet: SnippetData.fromJson(json['snippet']),
//     );
//   }
// }
