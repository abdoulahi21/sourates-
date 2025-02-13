import 'package:flutter/material.dart';
import 'package:sourates/services/api_service.dart';
import 'package:sourates/style/style.dart';
import 'package:sourates/model/Surah.dart';
import 'package:sourates/widgets/surah_custom_tile.dart';
class SurahView extends StatefulWidget {
  const SurahView({super.key});

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
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
            bottom: TabBar(
              tabs: [
                Tab(text: 'Surah'),
                Tab(text: 'Sajda'),
                Tab(text: 'Juz'),
              ],
              labelStyle: titleGreenStyle(),
            ),
          ),
          body: TabBarView(
            children: [
              FutureBuilder(
                future: _apiService.fetchSouratesList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Surah>> snapshot) {
                  if (snapshot.hasData) {
                    List<Surah>? surahs = snapshot.data!;
                    return ListView.builder(
                      itemCount: surahs.length,
                      itemBuilder: (BuildContext context, int index) =>
                          SurahCustomListTile(
                              surah: surahs[index],
                              context: context,
                              ontap: () {}),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              Center(child: Text('Contenu Onglet 2')),
              Center(child: Text('Contenu Onglet 3')),
            ],
          ),
        ),
      ),
    );
  }
}
