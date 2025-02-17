import 'package:flutter/material.dart';

import 'package:sourates/services/api_service.dart';
import 'package:sourates/model/Qari.dart';
import 'package:sourates/views/audio_surah_screen.dart';
import 'package:sourates/widgets/qari_custom_tile.dart';
import 'package:sourates/style/style.dart';

class QariListScreen extends StatefulWidget {
  const QariListScreen({super.key});

  @override
  _QariListScreenState createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {
  ApiService apiServices = ApiService();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Al-Quran lecture',
            style: titleGreenStyle(),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: blueColor,
              backgroundImage: const AssetImage(
                "assets/icons/quran.png",
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 0, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
          decoration: InputDecoration(
            hintText: 'Rechercher une voix',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onChanged: (value) {
            setState(() {
            _searchText = value;
            });
          },
          ),
        ),
              SizedBox(height: 20),
                Expanded(
                child: FutureBuilder(
                  future: apiServices.fetchQariList(),
                  builder: (BuildContext context, AsyncSnapshot<List<Qari>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                    child: Text('Qari\'s data not found '),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                    child: CircularProgressIndicator(),
                    );
                  }
                  List<Qari> filteredQariList = snapshot.data!
                    .where((qari) => qari.name!.toLowerCase().contains(_searchText.toLowerCase()))
                    .toList();
                  return ListView.builder(
                    itemCount: filteredQariList.length,
                    itemBuilder: (context, index) {
                    return QariCustomTile(
                      qari: filteredQariList[index],
                      ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => AudioSurahScreen(qari: filteredQariList[index]),
                        ),
                      );
                      },
                    );
                    },
                  );
                  },
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}