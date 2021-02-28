import 'package:MusicApp/video_screen.dart';
import 'package:flutter/material.dart';
import 'audio_screen.dart';
import 'package:MusicApp/audio_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Music App',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Sacramento',
                    letterSpacing: 2,
                  ),
                ),
                Expanded(
                  // flex: 3,
                  child: Image(
                    image: AssetImage('images/music_logo4.png'),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.0),
                          child: MaterialButton(
                            child: Text(
                              'Audio Player',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Sacramento',
                                letterSpacing: 3,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AudioPage();
                                  },
                                ),
                              );
                            },
                            minWidth: 250.0,
                            height: 30.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.0),
                          child: MaterialButton(
                            child: Text(
                              'VideoPlayer',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Sacramento',
                                letterSpacing: 3,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return VideoPage();
                                  },
                                ),
                              );
                            },
                            minWidth: 250.0,
                            height: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
FlatButton(
                        color: Colors.red,
                        onPressed: () {
                          print('Audio Page');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return VideoPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'VideoPlayer',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Sacramento',
                            letterSpacing: 2,
                          ),
                        ),
                      ),            
*/