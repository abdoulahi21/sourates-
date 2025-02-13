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
      body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
          decoration: InputDecoration(
            hintText: 'Search Surah',
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
        Expanded(
          child: FutureBuilder(
          future: _apiService.fetchSouratesList(),
          builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
            if (snapshot.hasData) {
            List<Surah>? surahs = snapshot.data!;
            List<Surah> filteredSurahs = surahs.where((surah) {
              return surah.englishName.toLowerCase().contains(_searchText.toLowerCase());
            }).toList();
            return ListView.builder(
              itemCount: filteredSurahs.length,
              itemBuilder: (BuildContext context, int index) =>
                SurahCustomListTile(
              surah: filteredSurahs[index],
              context: context,
              ontap: () {},
              ),
            );
            }
            return Center(child: CircularProgressIndicator());
          },
          ),
        ),
        ],
      ),
      ),
    );
  }
}
