// import 'package:flutter/material.dart';
// import 'package:mad_2022_26/pages/youtubesearch/model/item_data.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class PlayVideo extends StatefulWidget {
//   final ItemData item;
//   const PlayVideo({super.key, required this.item});

//   @override
//   State<PlayVideo> createState() => _PlayVideoState();
// }

// class _PlayVideoState extends State<PlayVideo> {
//   late YoutubePlayerController _youtubePlayerController;

//   @override
//   void initState() {
//     _youtubePlayerController = YoutubePlayerController(
//         initialVideoId: widget.item.id.videoId,
//         flags: YoutubePlayerFlags(
//             mute: false,
//             loop: false,
//             forceHD: false,
//             autoPlay: false,
//             isLive: false));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           AspectRatio(
//               aspectRatio: 16 / 9,
//               child: YoutubePlayer(
//                 controller: _youtubePlayerController,
//                 progressIndicatorColor: Colors.red,
//               )),
//           // Text("${widget.item.snippet.title}"),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mad_2022_26/pages/youtubesearch/model/item_data.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// class PlayVideo extends StatefulWidget {
//   final ItemData item;
//   const PlayVideo({super.key, required this.item});

//   @override
//   State<PlayVideo> createState() => _PlayVideoState();
// }

// class _PlayVideoState extends State<PlayVideo> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.item.id.videoId,
//       params: const YoutubePlayerParams(
//         showControls: true,
//         showFullscreenButton: true,
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerScaffold(
//       controller: _controller,
//       builder: (context, player) {
//         return Scaffold(
//           appBar: AppBar(title: Text(widget.item.snippet.title)),
//           body: Column(
//             children: [
//               AspectRatio(aspectRatio: 16 / 9, child: player),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(widget.item.snippet.channelTitle),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mad_2022_26/pages/youtubesearch/model/item_data.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PlayVideo extends StatefulWidget {
  final ItemData item;
  const PlayVideo({super.key, required this.item});

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.item.id.videoId,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        //autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.item.snippet.title)),
          body: Column(
            children: [
              AspectRatio(aspectRatio: 16 / 9, child: player),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.item.snippet.channelTitle),
              )
            ],
          ),
        );
      },
    );
  }
}
