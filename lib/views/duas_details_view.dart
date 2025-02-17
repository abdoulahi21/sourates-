import 'package:sourates/model/Duas.dart';

import 'package:flutter/material.dart';
import 'package:sourates/style/style.dart';


class DuasDetailsView extends StatelessWidget {
  final Duas duas;

  DuasDetailsView({required this.duas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text(duas.name, style: titleGreenStyle()
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        CircleAvatar(
        backgroundColor: blueColor,
        backgroundImage: AssetImage(
          "assets/icons/prayer.png",
        ),
        )
      ],
      ),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        // Image du lieu 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
             '${duas.id}.  ' +duas.arabe,
            style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey), // Horizontal line added here
            SizedBox(height: 16),
            Text(
            duas.traduction,
            style: TextStyle(fontSize: 16),
            ),
          ],
          ),
        ),
        ],
      ),
      ),
    );
  }
}