import 'item_data.dart';
import 'page_info_data.dart';

class YouTubeSearchModel {
  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final String? regionCode;
  final PageInfoData? pageInfo;
  final List<ItemData> items;

  YouTubeSearchModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    required this.items,
  });

  factory YouTubeSearchModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'] as List? ?? [];

    final List<ItemData> itemData = rawItems
        .map((item) => ItemData.fromJson(item))
        .where((item) =>
            item.id?.kind == 'youtube#video' &&
            item.id?.videoId != null &&
            item.snippet != null)
        .toList();

    return YouTubeSearchModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      regionCode: json['regionCode'] as String?,
      pageInfo: json['pageInfo'] != null
          ? PageInfoData.fromJson(json['pageInfo'])
          : null,
      items: itemData,
    );
  }
}

// import 'package:mad_2022_26/pages/youtubesearch/model/item_data.dart';
// import 'package:mad_2022_26/pages/youtubesearch/model/page_info_data.dart';

// class YouTubeSearchModel {
//   final String kind;
//   final String etag;
//   final String nextPageToken;
//   final String regionCode;
//   final PageInfoData pageInfo;
//   final List<ItemData> items;

//   YouTubeSearchModel({
//     required this.kind,
//     required this.etag,
//     required this.nextPageToken,
//     required this.regionCode,
//     required this.pageInfo,
//     required this.items,
//   });

//   factory YouTubeSearchModel.fromJson(Map<String, dynamic> json) {
//     final items = json['items'] as List;
//     List<ItemData> itemData =
//         items.map((singleItem) => ItemData.fromJson(singleItem)).toList();

//     // final List<dynamic> items = json['items'] ?? [];
//     // final itemData = items
//     //     .map((item) => ItemData.fromJson(item))
//     //     .where((item) =>
//     //         item.id.kind == 'youtube#video' && item.id.videoId != null)
//     //     .toList();
//     return YouTubeSearchModel(
//       kind: json['kind'],
//       etag: json['etag'],
//       nextPageToken: json['nextPageToken'],
//       regionCode: json['regionCode'],
//       pageInfo: PageInfoData.fromJson(json['pageInfo']),
//       items: itemData,
//     );
//   }
// }
