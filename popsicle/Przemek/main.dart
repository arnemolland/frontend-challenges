import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD54E),
      body: Stack(
        children: [
          // Stick
          Positioned(
            bottom: 30.0,
            right: 0.0,
            left: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFECAA7F),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ],
            ),
          ),

          // Stick shadow
          Positioned(
            bottom: 130.0,
            right: 0.0,
            left: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFDBA072),
                        const Color(0xFFECAA7F),
                      ],
                      stops: [
                        0.85,
                        1.0,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Ice Cream
          Positioned(
            child: IceCream(),
          ),
        ],
      ),
    );
  }
}

class IceCream extends StatelessWidget {
  const IceCream();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top
        Positioned(
          bottom: 150.0,
          right: 0.0,
          left: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 275.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF384B7),
                  borderRadius: BorderRadius.circular(35.0),
                ),
              ),
            ],
          ),
        ),

        // Top glare
        Positioned(
          bottom: 287.5,
          right: 0.0,
          left: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 275.0,
                height: 275.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF797C5),
                  borderRadius: BorderRadius.circular(300.0),
                ),
              ),
            ],
          ),
        ),

        // Bottom
        Positioned(
          bottom: 275.0,
          right: 0.0,
          left: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 275.0,
                height: 275.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF384B7),
                  borderRadius: BorderRadius.circular(300.0),
                ),
              ),
            ],
          ),
        ),

        // Glare bin
        Positioned(
          bottom: 450.0,
          right: 0.0,
          left: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(65.0, 0),
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Container(
                    width: 90.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF499C3),
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(90.0, 45.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Eyes
        Positioned(
          bottom: 245.0,
          right: 0.0,
          left: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IceCreamEye(),
              const SizedBox(width: 125.0),
              IceCreamEye(),
            ],
          ),
        ),

        // Smile
        Positioned(
          bottom: 200.0,
          right: 0.0,
          left: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.0,
                height: 33.0,
                decoration: BoxDecoration(
                  color: Color(0xFFED3595),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(6.0),
                    bottom: Radius.circular(25.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF39AC3),
                      offset: Offset(0.0, 1.0),
                      spreadRadius: 0.5,
                      blurRadius: 1.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IceCreamEye extends StatefulWidget {
  const IceCreamEye();

  @override
  _IceCreamEyeState createState() => _IceCreamEyeState();
}

class _IceCreamEyeState extends State<IceCreamEye> with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: Duration(milliseconds: 800),
    vsync: this,
  );
  late final Animation animation = CurvedAnimation(
    curve: Curves.easeInOutCubic,
    parent: controller,
  );
  Timer? timer;
  Offset position = Offset(0, -12.5);
  Offset target = Offset(0, -12.5);

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 800), (Timer timer) async {
      await Future.delayed(Duration(milliseconds: 1000));
      position = target;
      target = Offset(Random().nextDouble() * 15.0 - 7.5, Random().nextDouble() * 15.0 - 7.5);
      controller.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.0,
      height: 25.0,
      // padding: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE83891),
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: -10.0,
            blurRadius: 10.0,
          ),
          BoxShadow(
            color: Color(0xFFF39AC3),
            spreadRadius: 1.0,
            blurRadius: 0.0,
          ),
        ],
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: animation,
          child: Container(
            width: 7.5,
            height: 7.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          builder: (BuildContext context, Widget? child) {
            return Transform.translate(
              offset: Offset.lerp(position, target, animation.value)!,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
