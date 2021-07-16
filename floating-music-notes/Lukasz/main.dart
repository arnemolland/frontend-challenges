import 'dart:math';
​
import 'package:flutter/material.dart';
​
void main() {
  runApp(MyApp());
}
​
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Add(),
    );
  }
}
​
class Add extends StatefulWidget {
  const Add({
    Key? key,
  }) : super(key: key);
​
  @override
  _AddState createState() => _AddState();
}
​
class _AddState extends State<Add> with SingleTickerProviderStateMixin {
  late AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 750),
  );
  bool wasStarted = false;
​
  late Animation<double> _boomBoxSizeFactor;
​
  @override
  void initState() {
    super.initState();
​
    _animationController.value = 0.0;
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.repeat(reverse: true);
      }
      setState(() {});
    });
​
    _boomBoxSizeFactor = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.easeInExpo,
      ),
    ));
  }
​
  @override
  Widget build(BuildContext context) {
    if (!wasStarted) {
      wasStarted = true;
      _animationController.animateTo(1.0);
    }
​
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double size = min(constraints.maxWidth, constraints.maxHeight);
​
            final double boomboxSize = size / 4;
​
            return Center(
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.black54,
                ),
                child: Stack(
                  children: [
                    _buildSingleNote(
                      stackSize: size,
                      angle: 0,
                    ),
                    _buildSingleNote(
                      stackSize: size,
                      angle:  2 * pi,
                    ),
                    _buildSingleNote(
                      stackSize: size,
                      angle: - 2 * pi,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildBoombox(
                        size: boomboxSize,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
​
  Widget _buildSingleNote({
    required double stackSize,
    required double angle,
  }) {
    final double baseSize = 40;
    final double factor = min(_boomBoxSizeFactor.value * 2, 1.0);
​
    return Positioned(
      left: ((stackSize / 2) - (baseSize / 2) * (factor * angle / pi)),
      top: ((stackSize * 3 / 4) - baseSize) * factor,
      child: Transform.rotate(
        angle: angle,
        child: Opacity(
          opacity: factor,
          child: Icon(
            Icons.music_note,
            size: baseSize,
          ),
        ),
      ),
    );
  }
​
  Widget _buildBoombox({
    required double size,
  }) {
    final double half = size / 2;
​
    return Container(
      width: size,
      height: size,
      child: Center(
        child: Container(
          width: half + (half * _boomBoxSizeFactor.value),
          height: half + (half * _boomBoxSizeFactor.value),
          decoration: BoxDecoration(
            color: Colors.black54,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
