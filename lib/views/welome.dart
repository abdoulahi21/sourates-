import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sourates/style/style.dart';
import 'package:sourates/views/home.dart';

class Welome extends StatefulWidget {
  const Welome({super.key});

  @override
  State<Welome> createState() => _WelomeState();
}

class _WelomeState extends State<Welome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  width: MediaQuery.of(context).size.width * .8,
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                SizedBox(height: 60),
                Text(
                  'Sourates+',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arial',
                  ),
                ),
                Text("Version 1.0",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'arial',
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
