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
      home: Container(
        color: Color.fromRGBO(255, 213, 78, 1.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Container(
                  width: 60.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 170, 127, 1.0),
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 86.0),
                child: Container(
                  width: 60.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(219, 160, 114, 1.0),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Container(
                  width: 200.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 132, 183, 1.0),
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 160.0),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(249, 156, 197, 1.0),
                    borderRadius: BorderRadius.circular(
                      100.0,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 130.0),
                child: Container(
                  width: 200.0,
                  height: 220.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 132, 183, 1.0),
                    borderRadius: BorderRadius.circular(
                      100.0,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 140.0),
                child: Container(
                  width: 80.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 53, 149, 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 140.0),
                child: Material(
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  elevation: 3.0,
                  child: Container(
                    width: 80.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(237, 53, 149, 1.0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 175.0),
                child: Container(
                  width: 200.0,
                  height: 30.0,
                  child: Row(
                    children: [
                      SizedBox(width: 30.0),
                      Material(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        elevation: 3.0,
                        shadowColor: Colors.white,
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(237, 53, 149, 1.0),
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                height: 5.0,
                                width: 5.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Material(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        elevation: 3.0,
                        shadowColor: Colors.white,
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(237, 53, 149, 1.0),
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                height: 5.0,
                                width: 5.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30.0),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 280.0, left: 110.0),
                child: Transform.rotate(
                  angle: 0.15,
                  child: Transform(
                    transform: Matrix4.skew(0.4, 0.4),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 156, 197, 1.0),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
