import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mad_2022_26/pages/youtubesearch/model/item_data.dart';
import 'package:mad_2022_26/pages/youtubesearch/model/youtube_search_model.dart';

class YoutubeSearchPage extends StatefulWidget {
  const YoutubeSearchPage({super.key});

  @override
  State<YoutubeSearchPage> createState() => _YoutubeSearchPageState();
}

class _YoutubeSearchPageState extends State<YoutubeSearchPage> {
  bool _isSearch = false;
  bool _isLoading = false;
  int navIndex = 0;
  List<ItemData> items = [];
  final TextEditingController _controller = TextEditingController();

  final String baseURL = "https://youtube.googleapis.com/youtube/v3/";
  final String API_KEY =
      "AIzaSyAUYvwctjiGcu9oky5GILy7d1ZZBd_5zec"; // Consider using env variables

  final httpClient = http.Client();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _searchYouTubeVideos() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    final url =
        '${baseURL}search?part=snippet&maxResults=8&q=$query&type=video&key=$API_KEY';
    final encodedUrl = Uri.encodeFull(url);
    final response = await httpClient.get(Uri.parse(encodedUrl));

    if (response.statusCode == 200) {
      final data = YouTubeSearchModel.fromJson(json.decode(response.body));
      setState(() {
        items = data.items;
        _isLoading = false;
      });
    } else {
      print("Failed to fetch videos: ${response.statusCode}");
      setState(() {
        _isLoading = false;
      });
    }
  }
  // @override
  // void initState() {
  //   super.initState();
  //   _searchYouTubeVideos(); // Fetch default videos on load
  // }

  // Future<void> _searchYouTubeVideos([String query = "Doremon"]) async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   final url =
  //       '${baseURL}search?part=snippet&maxResults=8&q=$query&type=video&key=$API_KEY';
  //   final encodedUrl = Uri.encodeFull(url);
  //   final response = await httpClient.get(Uri.parse(encodedUrl));

  //   if (response.statusCode == 200) {
  //     final data = YouTubeSearchModel.fromJson(json.decode(response.body));
  //     setState(() {
  //       items = data.items;
  //       _isLoading = false;
  //     });
  //   } else {
  //     print("Failed to fetch videos: ${response.statusCode}");
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  Widget _searchWidget() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isSearch = !_isSearch;
            });
          },
          child: Icon(Icons.arrow_back),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Container(
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.black.withAlpha(25),
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: _searchYouTubeVideos, child: Icon(Icons.search)),
                hintText: "Search YouTube",
                border: InputBorder.none,
              ),
              onSubmitted: (value) => _searchYouTubeVideos(),
            ),
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(25),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.mic),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: _isSearch
            ? _searchWidget()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: Image.asset("assets/youtube_logo.png"),
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications_none_outlined),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isSearch = !_isSearch;
                          });
                        },
                        child: Icon(Icons.search),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: navIndex,
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: "Subscription"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "Library"),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : items.isEmpty
              ? Center(child: Text("No results found."))
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/playvideo',
                          arguments: item,
                        );
                      },
                      child: SizedBox(
                        height: 280,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                color: Colors.grey,
                                child: item.snippet?.thumbnails?.medium?.url !=
                                        null
                                    ? Image.network(
                                        item.snippet?.thumbnails?.medium?.url ??
                                            '', // Use null-coalescing operator
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/placeholder.jpg', // Placeholder image if no thumbnail is available
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "Title: ${item.snippet?.title}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: 4),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "Channel Title: ${item.snippet?.channelTitle}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}































// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mad_2022_26/pages/youtubesearch/model/item_data.dart';
// import 'package:mad_2022_26/pages/youtubesearch/model/youtube_search_model.dart';

// class YoutubeSearchPage extends StatefulWidget {
//   const YoutubeSearchPage({super.key});

//   @override
//   State<YoutubeSearchPage> createState() => _YoutubeSearchPageState();
// }

// class _YoutubeSearchPageState extends State<YoutubeSearchPage> {
//   bool _isSearch = false;
//   //bool _isLoading = true;
//   int navIndex = 0;
//   List<ItemData> items = [];
//   @override
//   void initState() {
//     super.initState();
//     _loadMockDataFromAssets();
//   }

//   Future<void> _loadMockDataFromAssets() async {
//     // Future.delayed(Duration(seconds: 3), () {
//     //   setState(() {
//     //     _isLoading = false;
//     //   });
//     // });

//     final assetsData =
//         await rootBundle.loadString("assets/data/youtube_search.json");

//     // final assetsData = await DefaultAssetBundle.of(context)
//     //     .loadString("assets/data/youtube_search.json");
//     final response = YouTubeSearchModel.fromJson(json.decode(assetsData));
//     items = response.items;
//     print(json.decode(assetsData));

//     //print(response);
//   }

//   Widget _searchWidget() {
//     return Row(
//       children: [
//         InkWell(
//             onTap: () {
//               setState(() {
//                 _isSearch = !_isSearch;
//               });
//             },
//             child: Icon(Icons.arrow_back)),
//         SizedBox(
//           width: 5,
//         ),
//         Expanded(
//             child: Container(
//                 height: 45,
//                 padding: EdgeInsets.symmetric(horizontal: 8),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(8)),
//                     color: Colors.black.withAlpha(25)),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       hintText: "Search YouTube", border: InputBorder.none),
//                 ))),
//         SizedBox(
//           width: 5,
//         ),
//         Container(
//             width: 28,
//             height: 28,
//             decoration: BoxDecoration(
//               color: Colors.black.withAlpha(25),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(Icons.mic)),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: _isSearch
//             ? _searchWidget()
//             : Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                       height: 50,
//                       child: Image.asset("assets/youtube_logo.png")),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Icon(Icons.notifications_none_outlined),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             _isSearch = !_isSearch;
//                           });
//                         },
//                         child: Icon(Icons.search),
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Container(
//                         width: 30,
//                         height: 30,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.grey,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           selectedItemColor: Colors.red,
//           unselectedItemColor: Colors.grey,
//           showUnselectedLabels: true,
//           currentIndex: navIndex,
//           onTap: (index) {
//             setState(() {
//               navIndex = index;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.explore_outlined), label: "Explore"),
//             BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.attach_money), label: "Subscription"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.library_books), label: "Library"),
//           ]),
//       body: ListView.builder(
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return SizedBox(
//             height: 280,
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 200,
//                     width: double.infinity,
//                     color: Colors.grey,
//                     // child: Image.network(
//                     //   "https://i.ytimg.com/vi/jqxz7QvdWk8/default.jpg",
//                     //   fit: BoxFit.none,
//                     // ),

//                     child: Image.network(
//                         items[index].snippet.thumbnails.medium.url),
//                     //child: Text('${items[index].id}'),
//                     // child: Center(child: Text(items[index].snippet.title)),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     "Title : ",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Channel Title : ",
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:convert';
// //import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mad_2022_26/pages/youtubesearch/model/item_data.dart';
// import 'package:mad_2022_26/pages/youtubesearch/model/youtube_search_model.dart';
// //import 'package:http/http.dart' as http;

// class YoutubeSearchPage extends StatefulWidget {
//   const YoutubeSearchPage({super.key});

//   @override
//   State<YoutubeSearchPage> createState() => _YoutubeSearchPageState();
// }

// class _YoutubeSearchPageState extends State<YoutubeSearchPage> {
//   bool _isSearch = false;
//   bool _isLoading = true;
//   int navIndex = 0;
//   List<ItemData> items = [];

//   // final TextEditingController _controller = TextEditingController();

//   // String baseURL = "https://youtube.googleapis.com/youtube/v3/";
//   // String API_KEY = "AIzaSyAUYvwctjiGcu9oky5GILy7d1ZZBd_5zec";

//   // final httpClient = http.Client();
//   // //"search?part=snippet&maxResults=8&q=flutter&videoType=any&key=AIzaSyAUYvwctjiGcu9oky5GILy7d1ZZBd_5zec";

//   // @override
//   // void dispose() {
//   //   _controller.dispose();
//   //   super.dispose();
//   // }

//   @override
//   void initState() {
//     super.initState();
//     _loadMockDataFromAssets();
//   }

//   Future<void> _loadMockDataFromAssets() async {
//     // String url =
//     //     '${baseURL}search?part=snippet&maxResults=8&q=${_controller.text}&videoType=any&key=$API_KEY';

//     // final encodeFul = Uri.encodeFull(url);
//     // final response = await httpClient.get(Uri.parse(encodeFul));

//     // if (response.statusCode == 200) {
//     //   final data = YouTubeSearchModel.fromJson(json.decode(response.body));
//     //   setState(() {
//     //     items = data.items;
//     //     _isLoading = false;
//     //   });
//     // }

//     final assetsData =
//         await rootBundle.loadString("assets/data/youtube_search.json");

//     final response = YouTubeSearchModel.fromJson(json.decode(assetsData));

//     setState(() {
//       items = response.items;
//       _isLoading = false;
//     });
//   }

//   Widget _searchWidget() {
//     return Row(
//       children: [
//         InkWell(
//           onTap: () {
//             setState(() {
//               _isSearch = !_isSearch;
//             });
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         SizedBox(width: 5),
//         Expanded(
//           child: Container(
//             height: 45,
//             padding: EdgeInsets.symmetric(horizontal: 8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(8)),
//               color: Colors.black.withAlpha(25),
//             ),
//             child: TextField(
//               //controller: _controller,
//               decoration: InputDecoration(
//                 // suffixIcon: InkWell(
//                 //     onTap: () {
//                 //       _loadMockDataFromAssets();
//                 //     },
//                 //     child: Icon(Icons.search)),
//                 hintText: "Search YouTube",
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 5),
//         Container(
//           width: 28,
//           height: 28,
//           decoration: BoxDecoration(
//             color: Colors.black.withAlpha(25),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(Icons.mic),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: _isSearch
//             ? _searchWidget()
//             : Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                     child: Image.asset("assets/youtube_logo.png"),
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(width: 8),
//                       Icon(Icons.notifications_none_outlined),
//                       SizedBox(width: 8),
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             _isSearch = !_isSearch;
//                           });
//                         },
//                         child: Icon(Icons.search),
//                       ),
//                       SizedBox(width: 8),
//                       Container(
//                         width: 30,
//                         height: 30,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.grey,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         currentIndex: navIndex,
//         onTap: (index) {
//           setState(() {
//             navIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.explore_outlined), label: "Explore"),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.attach_money), label: "Subscription"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.library_books), label: "Library"),
//         ],
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 final item = items[index];
//                 return InkWell(
//                   onTap: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/playvideo',
//                       arguments: item,
//                     );
//                   },
//                   child: SizedBox(
//                     height: 280,
//                     child: Card(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 200,
//                             width: double.infinity,
//                             color: Colors.grey,
//                             child: Image.network(
//                               item.snippet.thumbnails.medium.url,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Text(
//                               "Title: ${item.snippet.title}",
//                               maxLines: 1,
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Text(
//                               "Channel Title: ${item.snippet.channelTitle}",
//                               style: TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.w400),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }


