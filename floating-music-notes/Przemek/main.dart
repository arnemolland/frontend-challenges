import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: NoteSpawner(),
      ),
    );
  }
}

class NoteSpawner extends StatefulWidget {
  const NoteSpawner({Key? key}) : super(key: key);

  @override
  _NoteSpawnerState createState() => _NoteSpawnerState();
}

class _NoteSpawnerState extends State<NoteSpawner> {
  final List<NoteModel> notes = <NoteModel>[];

  @override
  void initState() {
    super.initState();

    notes.removeWhere((_) => true);

    for (int i = 0; i < 10; i++) {
      addNote();
    }
  }

  void addNote() {
    final Duration ttl = Duration(milliseconds: Random().nextInt(1000) + 2000);

    final NoteModel note = NoteModel(
      widget: Note(
        key: ValueKey<DateTime>(DateTime.now()),
        ttl: ttl,
      ),
    );

    Timer(ttl, () {
      notes.remove(note);
      addNote();
      setState(() {});
    });

    notes.add(note);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: notes
          .map(
            (NoteModel note) => note.widget,
          )
          .toList(),
    );
  }
}

class Note extends StatefulWidget {
  const Note({
    Key? key,
    required this.ttl,
  }) : super(key: key);

  final Duration ttl;

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> with SingleTickerProviderStateMixin {
  late final String note = Random().nextBool() ? 'assets/single.png' : 'assets/music.png';
  late final double randomSpawn = (Random().nextInt(50) - 25).toDouble();
  late final Offset destination = Offset(
    (Random().nextInt(20) - 10).toDouble(),
    (-100 - Random().nextInt(200)).toDouble(),
  );
  late final double sinModifier = Random().nextDouble();
  late final double angleModifier = Random().nextDouble() - 0.5;
  late final double scaleModifier = (Random().nextDouble() / 2) - 0.25;

  late final AnimationController _controller = AnimationController(
    duration: widget.ttl,
    vsync: this,
  );
  late final Animation _animation = CurvedAnimation(
    curve: Curves.easeInOut,
    parent: _controller,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: Image.asset(
        note,
        width: 28,
      ),
      builder: (BuildContext context, Widget? child) {
        if (child == null) return const SizedBox();

        final Offset spawn = Offset(
          (MediaQuery.of(context).size.width / 2) + randomSpawn,
          MediaQuery.of(context).size.height / 2,
        );

        final Offset modifiedDestination = destination.translate(
          sin(_animation.value * sinModifier * pi * 2) * 50,
          0,
        );

        final Offset position = Offset.lerp(
          spawn,
          spawn + modifiedDestination,
          _animation.value,
        )!;

        return Positioned(
          top: position.dy,
          right: position.dx,
          child: Opacity(
            opacity: getOpacity(_animation.value),
            child: Transform.scale(
              scale: getScale(_animation.value),
              child: Transform.rotate(
                angle: angleModifier * _animation.value * pi,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }

  double getOpacity(double progress) {
    if (progress < 0.15) {
      return progress * (1 / 0.15);
    }

    return 1.0 - _animation.value;
  }

  double getScale(double progress) {
    if (progress < 0.15) {
      return progress * (1 / 0.15) + scaleModifier;
    }

    return 1.0 - (_animation.value * 0.75) + scaleModifier;
  }
}

class NoteModel {
  const NoteModel({
    required this.widget,
  });

  final Widget widget;
}
