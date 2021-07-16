import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _rotationController;
  late AnimationController _rotationController1;
  late AnimationController _rotationController2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 5),
    );
    _controller1 = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 4),
    );
    _controller2 = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 6),
    );
    _controller.addListener(() {
      setState(() {});
    });
    _rotationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 1500),
    );
    _rotationController1 = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 1000),
    );
    _rotationController2 = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 1200),
    );
  }

  void _incrementCounter() {
    _controller.repeat();
    Timer(Duration(seconds: 1), () {
      _controller1.repeat();
    });
    Timer(Duration(seconds: 2), () {
      _controller2.repeat();
    });

    _rotationController.repeat(reverse: true);
    _rotationController1.repeat(reverse: true);
    _rotationController2.repeat(reverse: true);
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
        children: [
          Align(
            alignment: Alignment(0.0, 0.7),
            child: Opacity(
              opacity: 1 - (1 - _controller.value * 2).abs(),
              child: Transform.translate(
                offset: Offset(
                  0 + (_rotationController.value * 40),
                  -300 * _controller.value,
                ),
                child: Transform.rotate(
                  angle: -0.4 + (_rotationController.value * 0.7),
                  child: Transform.scale(
                    scale: 1 - _controller.value * 0.2,
                    child: SvgPicture.asset('assets/nuta.svg'),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.4, 0.7),
            child: Opacity(
              opacity: 1 - (1 - _controller1.value * 2).abs(),
              child: Transform.translate(
                offset: Offset(
                  0 + (_rotationController1.value * 40) + _controller.value * 30,
                  -300 * _controller1.value,
                ),
                child: Transform.rotate(
                  angle: -0.4 + (_rotationController1.value * 0.7),
                  child: Transform.scale(
                    scale: 1 - _controller1.value * 0.2,
                    child: SvgPicture.asset('assets/nuta.svg'),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.4, 0.7),
            child: Opacity(
              opacity: 1 - (1 - _controller2.value * 2).abs(),
              child: Transform.translate(
                offset: Offset(
                  0 + (_rotationController2.value * 40) + _controller2.value * -30,
                  -300 * _controller2.value,
                ),
                child: Transform.rotate(
                  angle: -0.4 + (_rotationController2.value * 0.7),
                  child: Transform.scale(
                    scale: 1 - _controller2.value * 0.2,
                    child: SvgPicture.asset('assets/nuta.svg'),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'SPEAKER',
                style: TextStyle(fontSize: 38.0),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

