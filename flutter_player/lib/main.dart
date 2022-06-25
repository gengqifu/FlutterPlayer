import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Player',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AudioCache _audioCache;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  void _initAudioPlayer() {
    _audioCache = AudioCache();
    _audioPlayer = AudioPlayer();
    _audioCache.fixedPlayer = _audioPlayer;
    _audioCache.play('sounds/Beyond - 真的爱你.mp3');
    //循环播放
    _audioCache.loop('sounds/Beyond - 真的爱你.mp3');
  }

  //开始播放
  void _play() {
    final result = _audioCache.play('sounds/Beyond - 真的爱你.mp3');
    if (result == 1) {
      print('succes');
    }
  }

  //暂停
  void _pause() {
    final result = _audioPlayer.pause();
    if (result == 1) {
      print('succes');
    }
  }

  //停止播放
  _stop() {
    final result = _audioPlayer.stop();
    if (result == 1) {
      print('succes');
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Stack(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        // mainAxisAlignment: MainAxisAlignment.center,
        alignment: const Alignment(0.8, 0.8),
        children: <Widget>[
          new Image.asset(
            'images/lake.jpeg',
            width: 600.0,
            height: 7400.0,
            fit: BoxFit.cover,
          ),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            new Container(
              padding: new EdgeInsets.all(0.0),
              child: new IconButton(
                icon:
                    (new Icon(Icons.play_arrow, color: Colors.blue, size: 30)),
                color: Colors.blue,
                onPressed: _play,
              ),
            ),
            new Container(
              padding: new EdgeInsets.all(0.0),
              child: new IconButton(
                icon: (new Icon(Icons.pause, color: Colors.blue, size: 30)),
                color: Colors.blue,
                onPressed: _pause,
              ),
            ),
            new Container(
              padding: new EdgeInsets.all(0.0),
              child: new IconButton(
                icon: (new Icon(Icons.stop, color: Colors.blue, size: 30)),
                color: Colors.blue,
                onPressed: _stop,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
