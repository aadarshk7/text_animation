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
          height: 210,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: <Widget>[
              const Text(
                "Hello Flutter",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10), // Adding space between text and emojis
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: ''
                          '')
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
