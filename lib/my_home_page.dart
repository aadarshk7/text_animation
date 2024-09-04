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
  double top1 = 200;
  double top2 = 400;
  double left = 500;
  bool type = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        showanimation = true;
      });
    });
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
                  borderRadius: BorderRadius.circular(40),
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
                            RotateAnimatedText('Hello Flutter',
                                rotateOut: false),
                          ])),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: top1,
              left: 0,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                width: width - 40,
                child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 28, fontFamily: 'popin', color: Colors.blue),
                    child: AnimatedTextKit(
                        repeatForever: false,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText('This is a text animation example',
                              speed: const Duration(milliseconds: 100)),
                          TyperAnimatedText('Simple Animation Example',
                              speed: const Duration(milliseconds: 100)),
                          TyperAnimatedText('Animation Example',
                              speed: const Duration(milliseconds: 100)),
                        ])),
              ),
            ),
            showanimation
                ? AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    top: top2,
                    width: width,
                    child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Container(
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  width: 10,
                                  height: 100,
                                ),
                                const Text("Stay",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'popin',
                                        color: Colors.white)),
                                const SizedBox(
                                  width: 10,
                                  height: 100,
                                ),
                                DefaultTextStyle(
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    child: AnimatedTextKit(
                                      onFinished: () {
                                        setState(() {
                                          top1 = 400;
                                          top2 = 200;
                                          left = 0;
                                          type = true;
                                        });
                                      },
                                      repeatForever: false,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        RotateAnimatedText('Hungry'),
                                        RotateAnimatedText('Foolish'),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        )),
                  )
                : Container(),
            AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                top: 450,
                left: left,
                child: Container(
                  width: width - 40,
                  height: 350,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 32),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                      child: type
                          ? DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                              child: AnimatedTextKit(
                                  repeatForever: false,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TypewriterAnimatedText("Flutter is fun ",
                                        curve: Curves.easeIn,
                                        speed:
                                            const Duration(milliseconds: 100)),
                                    TypewriterAnimatedText("Fun is Flutter ",
                                        curve: Curves.easeIn,
                                        speed:
                                            const Duration(milliseconds: 100)),
                                    TypewriterAnimatedText("Developing is fun ",
                                        curve: Curves.easeIn,
                                        speed:
                                            const Duration(milliseconds: 100)),
                                    TypewriterAnimatedText(
                                        "Flutter depends on dart ",
                                        curve: Curves.easeIn,
                                        speed:
                                            const Duration(milliseconds: 100)),
                                  ]))
                          : Text("")),
                ))
          ],
        ),
      ),
    );
  }
}
