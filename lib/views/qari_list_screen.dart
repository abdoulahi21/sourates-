import 'package:flutter/material.dart';

import 'package:sourates/services/api_service.dart';
import 'package:sourates/model/Qari.dart';
import 'package:sourates/views/audio_surah_screen.dart';
import 'package:sourates/widgets/qari_custom_tile.dart';


class QariListScreen extends StatefulWidget {
  const QariListScreen({Key? key}) : super(key: key);

  @override
  _QariListScreenState createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {
  ApiService  apiServices = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Qari\'s '),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.only(top: 20,left: 12,right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1,
                        spreadRadius: 0.0,
                        offset: Offset(0,1),
                      ),
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Search'),
                      Spacer(),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: FutureBuilder(
                  future: apiServices.fetchQariList(),
                  builder: (BuildContext context , AsyncSnapshot<List<Qari>> snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text('Qari\'s data not found '),);
                    }
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context , index){
                        return QariCustomTile(qari: snapshot.data![index],
                            ontap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder:(context)=>
                                      AudioSurahScreen(qari: snapshot.data![index])));
                            });
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