import 'package:flutter/material.dart';
import 'package:sourates/services/api_service.dart';
import 'package:sourates/constants/constants.dart';
import 'package:sourates/style/style.dart';
import 'package:sourates/model/translation.dart';
import 'package:sourates/widgets/custom_translation.dart';
class SurahDetails extends StatefulWidget {
  const SurahDetails({super.key});

  static const String id = 'surah_details';
  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  final ApiService _apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: backgroundColor,
        body: FutureBuilder(
            future: _apiService.getTranslation(Constants.surahIndex!),
            builder: (BuildContext context,
                AsyncSnapshot<SurahTranslationList> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context, index) {
                    return TranslationTile(
                      index: index,
                      translation: snapshot.data!.translationList[index],
                    );
                  },
                  );
                } else  {
                  return  Center(child: Text('No data available.'));
                }
              },
            )
            );
                
  }
}
