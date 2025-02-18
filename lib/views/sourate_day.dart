import 'package:flutter/material.dart';
import 'package:sourates/model/AyaOfTheDay.dart';
import 'package:sourates/services/api_service.dart';

class SourateDay extends StatefulWidget {
  const SourateDay({super.key});

  @override
  State<SourateDay> createState() => _SourateDayState();
}

class _SourateDayState extends State<SourateDay> {
final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Expanded(
  child: FutureBuilder<AyaOfTheDay>(
  future: _apiService.fetchSourates(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Erreur : ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data == null) {
      return Center(child: Text('Aucune donnée disponible.'));
    }

    // Maintenant, on est sûr que snapshot.data n'est pas null
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        snapshot.data!.arText ?? 'Texte arabe non disponible',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
        snapshot.data!.enTran ?? 'Texte anglais non disponible',
        style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Text(
        'Numéro de Sourate: ${snapshot.data!.surNumber ?? 'Numéro inconnu'}',
        style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 10),
        Text(
        'Nom de la Sourate: ${snapshot.data!.surEnName ?? 'Nom inconnu'}',
        style: TextStyle(fontSize: 14),
        ),
      ],
      ),
    );
  },
)

)

      ), 
    );
  }
}