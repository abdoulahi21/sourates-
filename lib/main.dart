import 'package:flutter/material.dart';
import 'package:sourates/views/surah_details.dart';
import 'package:sourates/views/welome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sourates+',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Welome(),
      routes: {
        SurahDetails.id: (context) => SurahDetails(),
      },
    );
  }
}
