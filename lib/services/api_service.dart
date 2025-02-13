import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:sourates/model/AyaOfTheDay.dart';
import 'package:sourates/model/Surah.dart';
import 'package:http/http.dart';
import 'package:sourates/model/qari.dart';
import 'package:sourates/model/translation.dart';

class ApiService {
  final enPointUrl = "http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  //recuperer le sourate du jour
  Future<AyaOfTheDay> fetchSourates() async {
    String url =
        'http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return AyaOfTheDay.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  random(min, max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

  //recuperer les sourates
  Future<List<Surah>> fetchSouratesList() async {
    Response response = await http.get(Uri.parse(enPointUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      print('ol ${list.length}');
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }

  //recuperer les traductions
  Future<SurahTranslationList> getTranslation(int index) async {
    final url = "https://quranenc.com/api/v1/translation/sura/french_rashid/$index";
    var res=await http.get(Uri.parse(url));
    return SurahTranslationList.fromJson(json.decode(res.body));
  }

  //qari
  List<Qari> qariList = [];

  Future<List<Qari>> fetchQariList() async {
    final url = "https://quranicaudio.com/api/qaris";
    final response = await http.get(Uri.parse(url));
    jsonDecode(response.body).forEach((element) {
      if (qariList.length < 20) {
        qariList.add(Qari.fromJson(element));
      }
    });
    qariList.sort((a, b) => a.name!.compareTo(b.name!));
    return qariList;
  }
}
