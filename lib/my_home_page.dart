import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final dynamic title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showanimation = false;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 5000), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 70,
              width: width,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                          repeatForever: false,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            RotateAnimatedText('Hello World', rotateOut: false),
                          ])),
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: width - 40,
                child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 30, fontFamily: 'popin', color: Colors.blue),
                    child: AnimatedTextKit(
                        repeatForever: false,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                              'This is a simple text animation example',
                              speed: const Duration(milliseconds: 100)),
                          TyperAnimatedText('Simple Animation Example',
                              speed: const Duration(milliseconds: 100)),
                          TyperAnimatedText('Animation Example',
                              speed: const Duration(milliseconds: 100)),
                        ])),
              ),
            ),
            showanimationPositioned(
              top: 400,
              width: width,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                          repeatForever: false,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            RotateAnimatedText('Hello World', rotateOut: false),
                          ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
