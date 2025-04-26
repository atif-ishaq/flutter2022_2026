class PageInfoData {
  final int? totalResults;
  final int? resultsPerPage;

  PageInfoData({
    this.totalResults,
    this.resultsPerPage,
  });

  factory PageInfoData.fromJson(Map<String, dynamic> json) {
    return PageInfoData(
      totalResults: json['totalResults'] is int
          ? json['totalResults']
          : int.tryParse('${json['totalResults']}'),
      resultsPerPage: json['resultsPerPage'] is int
          ? json['resultsPerPage']
          : int.tryParse('${json['resultsPerPage']}'),
    );
  }
}

// class PageInfoData {
//   final int totalResults;
//   final int resultsPerPage;

//   PageInfoData({required this.totalResults, required this.resultsPerPage});

//   factory PageInfoData.fromJson(Map<String, dynamic> json) {
//     return PageInfoData(
//         totalResults: json['totalResults'],
//         resultsPerPage: json['resultsPerPage']);
//   }
// }
