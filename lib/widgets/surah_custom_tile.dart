import 'package:flutter/material.dart';
import 'package:sourates/model/Surah.dart';

Widget SurahCustomListTile({
  required Surah surah,
  required BuildContext context,
  required VoidCallback ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  surah.number.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(surah.englishName, style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(surah.englishNameTranslation, style: TextStyle(
                    color: Colors.teal,
                  ),),
                ],
              ),
              Spacer(),
              Text(surah.name, style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ],
          )
        ],),
    
      )
  );
}
