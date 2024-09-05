import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextEmojisAnimation extends StatefulWidget {
  const TextEmojisAnimation({super.key});

  @override
  State<TextEmojisAnimation> createState() => _TextEmojisAnimationState();
}

class _TextEmojisAnimationState extends State<TextEmojisAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 199,
          width: 255,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: <Widget>[
              const Text(
                "Flutter Emoji's",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10), // Adding space between text and emojis
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: '🚀 ',
                      style: TextStyle(
                        fontSize: 30,
                      )),
                  TextSpan(
                      text: ' 💻 ',
                      style: TextStyle(
                        fontSize: 60,
                      )),
                  TextSpan(
                      text: '✨ ',
                      style: TextStyle(
                        fontSize: 30,
                      )),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
