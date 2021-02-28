import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  YoutubePlayerController _controller;
  String videoUrl = "https://www.youtube.com/watch?v=6w67NOaRe-w";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                      ),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                        print('back');
                      },
                    ),
                    Text(
                      'Video Player',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Sacramento',
                        letterSpacing: 2,
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ],
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(width: 2.0, color: Colors.red,)               
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: YoutubePlayer(
                        controller: _controller = YoutubePlayerController(
                            initialVideoId:
                                YoutubePlayer.convertUrlToId(videoUrl)),
                        showVideoProgressIndicator: true,
                        progressColors: ProgressBarColors(backgroundColor: Colors.white),
                        progressIndicatorColor: Colors.red,
                        
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
