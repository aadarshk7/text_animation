import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RawMagnifier(),
  ));
}

class RawMagnifier extends StatefulWidget {
  const RawMagnifier({super.key});

  @override
  State<RawMagnifier> createState() => _RawMagnifierState();
}

class _RawMagnifierState extends State<RawMagnifier> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Magnifier Example')),
      body: Center(
        child: GestureDetector(
          onScaleStart: (ScaleStartDetails details) {
            _previousScale = _scale;
            setState(() {});
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _scale = _previousScale * details.scale;
            });
          },
          onScaleEnd: (ScaleEndDetails details) {
            _previousScale = 1.0;
          },
          child: Transform.scale(
            scale: _scale,
            child: Image.asset('assets/images/coatme.jpg'), // Your image here
          ),
        ),
      ),
    );
  }
}
