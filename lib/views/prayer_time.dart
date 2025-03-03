import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:sourates/style/style.dart';
import 'package:intl/intl.dart';
import 'package:sourates/services/location.dart';
//import 'package:hijri/hijri_calendar.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
   LocationService locationService = LocationService();
    
  //var _hijri = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Heure de prière',
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
        body: FutureBuilder(
          future: locationService.getCurrentLocation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final myCoordinates = Coordinates(14.499454, -14.452362);
            final params =
                CalculationMethod.muslim_world_league.getParameters();
            params.madhab = Madhab.shafi;
            final prayerTimes = PrayerTimes.today(myCoordinates, params);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildPrayerTimeCard('Sobh(Fajr)', prayerTimes.fajr),
                  buildPrayerTimeCard('Dohr', prayerTimes.dhuhr),
                  buildPrayerTimeCard('Asr', prayerTimes.asr),
                  buildPrayerTimeCard('Maghreb', prayerTimes.maghrib),
                  buildPrayerTimeCard('Icha', prayerTimes.isha),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildPrayerTimeCard(String prayerName, DateTime prayerTime) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(prayerName, style: titleGreenStyle()),
            Text(DateFormat.jm().format(prayerTime), style: titleGreenStyle()),
          ],
        ),
      ),
    );
  }

  
}
