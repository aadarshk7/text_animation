import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final dynamic title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              width: width,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 100,
                color: Colors.redAccent,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
