// import 'package:MusicApp/controls.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AudioPage extends StatefulWidget {
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  Duration _duration = Duration();
  Duration _position = Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  // AnimationController _animationIconController1;
  int favourite = 0;
  int shuffle = 0;
  int loop = 0;
  double stop = 0.0;
  IconData iconDataFavourite = Icons.favorite_border;
  IconData iconDataShuffle = Icons.shuffle;
  String msg;
  int play = 0;
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    // _animationIconController1 = AnimationController(
    //   vsync: this,
    // );

    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        activeColor: Colors.black,
        inactiveColor: Colors.red,
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  toastFun(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0);
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivated');
    advancedPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  'Audio Player',
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
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 2.0),                    
                    ),
                    child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      border: Border.all(color: Colors.red, width: 3.0),
                      image: DecorationImage(
                        image: AssetImage('images/track21.jpg'),
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.loop_rounded,
                    size: 35,
                    color: loop == 1 ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      if (loop == 1) {
                        toastFun('Loop On');
                        loop = 0;
                      } else {
                        toastFun('Loop Off');
                        loop = 1;
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    iconDataShuffle,
                    size: 35,
                    color: shuffle == 1 ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      if (shuffle == 0) {
                        iconDataShuffle = Icons.shuffle_rounded;
                        shuffle = 1;
                        toastFun('Shuffle On');
                      } else {
                        iconDataShuffle = Icons.shuffle;
                        shuffle = 0;
                        toastFun('Shuffle Off');
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    iconDataFavourite,
                    size: 35,
                    color: favourite == 1 ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    print('favourite');
                    setState(() {
                      if (favourite == 0) {
                        iconDataFavourite = Icons.favorite;
                        favourite = 1;
                        toastFun('Added To Favourite');
                      } else {
                        iconDataFavourite = Icons.favorite_border;
                        favourite = 0;
                        toastFun('Removed From Favourite');
                      }
                    });
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                slider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "${_position.inMinutes.toInt().remainder(60)}:${_position.inSeconds.toInt().remainder(60)}"),
                      Text(
                          "${_duration.inMinutes.toInt().remainder(60)}:${_duration.inSeconds.toInt().remainder(60)}"),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.skip_previous_sharp,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () {
                      audioCache.play('tune.mp3');
                      toastFun('Previous Song');
                    },
                  ),
                  IconButton(
                      icon: Icon(
                        // Icons.pause_circle_filled,
                        Icons.pause,
                        color: Colors.black,
                        size: 40,
                      ),
                      onPressed: () {
                        advancedPlayer.pause();
                        toastFun('Paused');
                      }),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: play == 1 ? Colors.red : Colors.black,
                      size: 40,
                    ),
                    onPressed: () {
                      audioCache.play('nokia.mp3');
                      toastFun('Playing');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () {
                      advancedPlayer.stop();
                      toastFun('Stopped');
                      setState(() {
                        stop = 1;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next_sharp,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () {
                      audioCache.play('tune.mp3');
                      toastFun('Next Song Playing');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
