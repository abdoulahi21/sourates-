import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:sourates/model/AyaOfTheDay.dart';


class ApiService{

  //recuperer le sourate du jour
  Future<AyaOfTheDay> fetchSourates() async {
    String url = 'http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return AyaOfTheDay.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  random (min, max){
    var rn = new Random();
    return min + rn.nextInt(max - min);

  }
}