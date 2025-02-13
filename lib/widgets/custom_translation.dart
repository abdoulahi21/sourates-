import 'package:flutter/material.dart';
import 'package:sourates/model/translation.dart';

class TranslationTile extends StatelessWidget {

final int index;
final SurahTranslation translation;

const TranslationTile({super.key, required this.index, required this.translation});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
            ),
            Positioned(
              top: 3,
              left: 12,
              child: Container(
                padding: EdgeInsets.all(6),
                alignment: Alignment.center,
                child: Text("Verset:${translation.aya!}", style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(translation.arabic_text!, 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 8,),
              Text(translation.translation!,
              textAlign: TextAlign.center,
               style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
}
}