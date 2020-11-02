import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vibration/vibration.dart';
//import 'package:treasureapp/location.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _counter = 0;
  AudioPlayer _audioPlayer;
  AudioCache _player;

  @override
  void initState() {
    super.initState();

    //_audioPlayer = AudioPlayer();
    _player = AudioCache();
    //_audioPlayer.setUrl("decision7.mp3", isLocal: true);
    //_audioPlayer.setReleaseMode(ReleaseMode.STOP);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    if (_audioPlayer != null) {
      _audioPlayer.dispose();
    }
    super.dispose();
  }

  void se() async {
    try {
      //await _audioPlayer.resume();
      //await _audioPlayer.play("assets/decision7.mp3", isLocal: true);
      await _player.play("decision7.mp3");
      Vibration.vibrate();
    } catch (ex) {
      debugPrint("Exception: " + ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Spacer(
              flex: 4,
            ),
            Image.asset(
              "images/title.png",
              fit: BoxFit.cover,
            ),
            Spacer(
              flex: 3,
            ),
            MenuButton(
              text: "ゲーム概要",
              onPressed: () => Navigator.of(context).pushNamed("/about"),
            ),
            Spacer(
              flex: 1,
            ),
            MenuButton(
              text: "コインの枚数を確認",
              onPressed: () => Navigator.of(context).pushNamed("/map"),
            ),
            Spacer(
              flex: 1,
            ),
            MenuButton(
              text: "景品に応募する",
              onPressed: () => Navigator.of(context).pushNamed("/form0"),
            ),
            Spacer(
              flex: 1,
            ),
            MenuButton(
              text: "宝箱を探す",
              onPressed: () => Navigator.of(context).pushNamed("/hunting"),
            ),
            Spacer(
              flex: 6,
            ),

/*
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                height: 50.0,
                padding: EdgeInsets.only(bottom:50),
                child: RaisedButton(
                  
                  onPressed: () => Navigator.of(context).pushNamed("/about"),
                  padding: EdgeInsets.only(top:10,left:30,right:30,bottom:10),
                  shape: StadiumBorder(),
                  color: Colors.lightGreen,
                  
                  child: Text(
                    "ゲーム概要",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 240, 240, 240)
                    )
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                height: 50.0,
                padding: EdgeInsets.only(bottom:50),
                child: RaisedButton(
                  
                  onPressed: () => Navigator.of(context).pushNamed("/hunting"),
                  padding: EdgeInsets.only(top:10,left:30,right:30,bottom:10),
                  shape: StadiumBorder(),
                  color: Colors.lightGreen,
                  
                  child: Text(
                    "宝箱を探す",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 240, 240, 240)
                    )
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                height: 50.0,
                padding: EdgeInsets.only(bottom:50),
                child: RaisedButton(
                  
                  onPressed: () => Navigator.of(context).pushNamed("/map"),
                  padding: EdgeInsets.only(top:10,left:30,right:30,bottom:10),
                  shape: StadiumBorder(),
                  color: Colors.lightGreen,
                  
                  child: Text(
                    "宝の地図",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 240, 240, 240)
                    )
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                height: 50.0,
                padding: EdgeInsets.only(bottom:50),
                child: RaisedButton(
                  
                  onPressed: () =>{},
                  padding: EdgeInsets.only(top:10,left:30,right:30,bottom:10),
                  shape: StadiumBorder(),
                  color: Colors.lightGreen,
                  
                  child: Text(
                    "コインの枚数を確認",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 240, 240, 240)
                    )
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                height: 50.0,
                padding: EdgeInsets.only(bottom:50),
                child: RaisedButton(
                  
                  onPressed: () =>{},
                  padding: EdgeInsets.only(top:10,left:30,right:30,bottom:10),
                  shape: StadiumBorder(),
                  color: Colors.lightGreen,
                  
                  child: Text(
                    "応募する",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 240, 240, 240)
                    )
                  ),
                ),
              ),
            ),
            */
            //LocationSample(),
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
      */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MenuButton extends StatelessWidget {
  static AudioCache _player = AudioCache();
  final String text;
  final Function() onPressed;

  const MenuButton({
    @required this.text,
    @required this.onPressed
  });

  void se() async {
    try {
      //await _audioPlayer.resume();
      //await _audioPlayer.play("assets/decision7.mp3", isLocal: true);
      _player.play("audio/decision22.mp3");
      //Vibration.vibrate();
    } catch (ex) {
      debugPrint("Exception: " + ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    _player.load("audio/decision22.mp3");
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 320.0,
        minHeight: 60.0,
      ),
      child: RaisedButton(
        onPressed: () {
          se();
          onPressed();
        },
        padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
        shape: StadiumBorder(),
        color: Colors.lightGreen,

        child: Text(
          text,
          style: TextStyle(
              fontSize: 28,
              fontFamily: "Tetu",
              color: Color.fromARGB(255, 240, 240, 240),
              shadows: [
                Shadow(
                  offset: Offset(1.0, 4.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ]),
        ),
        //child: Image.asset("images/txt01.png"),
      ),
    );
  }
}

Widget MenuButton01({String text, Function() onPressed}) {
  return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 320.0,
        minHeight: 60.0,
      ),
      child: RaisedButton(
        onPressed: onPressed,
        padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
        shape: StadiumBorder(),
        color: Colors.lightGreen,

        child: Text(
          text,
          style: TextStyle(
              fontSize: 28,
              fontFamily: "Tetu",
              color: Color.fromARGB(255, 240, 240, 240),
              shadows: [
                Shadow(
                  offset: Offset(1.0, 4.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ]),
        ),
        //child: Image.asset("images/txt01.png"),
      ));
}
