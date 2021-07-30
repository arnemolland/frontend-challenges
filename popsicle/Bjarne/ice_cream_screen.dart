import 'package:flutter/material.dart';

class IceCreamScreen extends StatelessWidget {
  const IceCreamScreen();

  static const yellow = Color.fromRGBO(255, 215, 92, 1);
  static const pink = Color.fromRGBO(248, 132, 183, 1);
  static const lightPink = Color.fromRGBO(255, 155, 199, 1);
  static const darkPink = Color.fromRGBO(243, 53, 147, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                _buildStick(constraints),
                _buildBodyHighlight(constraints),
                _buildBody(constraints),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStick(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: constraints.maxWidth * 0.2),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(238, 172, 130, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(constraints.maxWidth * 0.2),
              bottomRight: Radius.circular(constraints.maxWidth * 0.2),
            ),
          ),
          height: constraints.maxHeight * 0.2,
          width: constraints.maxWidth * 0.2,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return _buildStickShadow(constraints);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStickShadow(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: constraints.maxHeight * 0.3,
        width: constraints.maxWidth,
        color: Color.fromRGBO(0, 0, 0, 0.07),
      ),
    );
  }

  Widget _buildBody(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: constraints.maxWidth * 0.2),
        child: Container(
          decoration: BoxDecoration(
            color: pink,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(constraints.maxWidth * 0.8),
              topRight: Radius.circular(constraints.maxWidth * 0.8),
              bottomLeft: Radius.circular(constraints.maxWidth * 0.2),
              bottomRight: Radius.circular(constraints.maxWidth * 0.2),
            ),
          ),
          height: constraints.maxHeight * 0.65,
          width: constraints.maxWidth * 0.8,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: [
                  _buildLeftEye(constraints),
                  _buildRightEye(constraints),
                  _buildMouth(constraints),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: constraints.maxWidth * 0.15,
                        right: constraints.maxWidth * 0.15,
                      ),
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(320 / 360),
                        child: Container(
                          height: constraints.maxHeight * 0.2,
                          width: constraints.maxWidth * 0.2,
                          decoration: BoxDecoration(
                            color: lightPink,
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(
                                constraints.maxWidth * 0.2,
                                constraints.maxHeight * 0.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMouth(BoxConstraints constraints) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: constraints.maxWidth * 0.193),
            child: Container(
              height: constraints.maxHeight * 0.06,
              width: constraints.maxWidth * 0.3,
              decoration: BoxDecoration(
                color: lightPink,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(constraints.maxWidth * 0.055),
                  topRight: Radius.circular(constraints.maxWidth * 0.055),
                  bottomLeft: Radius.circular(constraints.maxWidth * 0.2),
                  bottomRight: Radius.circular(constraints.maxWidth * 0.2),
                ),
              ),
            ),
          ),
        ),
        _buildMouthHighlight(constraints),
      ],
    );
  }

  Widget _buildMouthHighlight(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: constraints.maxWidth * 0.2),
        child: Container(
          height: constraints.maxHeight * 0.06,
          width: constraints.maxWidth * 0.3,
          decoration: BoxDecoration(
            color: darkPink,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(constraints.maxWidth * 0.055),
              topRight: Radius.circular(constraints.maxWidth * 0.055),
              bottomLeft: Radius.circular(constraints.maxWidth * 0.2),
              bottomRight: Radius.circular(constraints.maxWidth * 0.2),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeftEye(BoxConstraints constraints) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: constraints.maxWidth / 5,
              bottom: constraints.maxWidth / 2.75,
            ),
            child: _buildEyeHighlight(constraints),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: constraints.maxWidth / 5,
              bottom: constraints.maxWidth / 2.7,
            ),
            child: _buildEye(constraints),
          ),
        ),
      ],
    );
  }

  Widget _buildRightEye(BoxConstraints constraints) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(
              right: constraints.maxWidth / 5,
              bottom: constraints.maxWidth / 2.75,
            ),
            child: _buildEyeHighlight(constraints),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(
              right: constraints.maxWidth / 5,
              bottom: constraints.maxWidth / 2.7,
            ),
            child: _buildEye(constraints),
          ),
        ),
      ],
    );
  }

  Widget _buildEye(BoxConstraints constraints) {
    return Container(
      height: constraints.maxWidth * 0.075,
      width: constraints.maxWidth * 0.075,
      decoration: BoxDecoration(
        color: darkPink,
        borderRadius: BorderRadius.circular(constraints.maxWidth * 0.1),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: constraints.maxWidth * 0.18),
              child: Container(
                height: constraints.maxHeight * 0.25,
                width: constraints.maxWidth * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(constraints.maxWidth * 0.1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEyeHighlight(BoxConstraints constraints) {
    return Container(
      height: constraints.maxWidth * 0.075,
      width: constraints.maxWidth * 0.075,
      decoration: BoxDecoration(
        color: lightPink,
        borderRadius: BorderRadius.circular(constraints.maxWidth * 0.1),
      ),
    );
  }

  Widget _buildBodyHighlight(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: constraints.maxWidth * 0.17),
        child: Container(
          decoration: BoxDecoration(
            color: lightPink,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(constraints.maxWidth * 0.8),
              topRight: Radius.circular(constraints.maxWidth * 0.8),
              bottomLeft: Radius.circular(constraints.maxWidth * 0.2),
              bottomRight: Radius.circular(constraints.maxWidth * 0.2),
            ),
          ),
          height: constraints.maxHeight * 0.65,
          width: constraints.maxWidth * 0.8,
        ),
      ),
    );
  }
}
