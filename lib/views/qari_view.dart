import 'package:flutter/material.dart';
import 'package:sourates/services/api_service.dart';
import 'package:sourates/style/style.dart';
import 'package:sourates/model/qari.dart';
import 'package:sourates/widgets/qari_custom_tile.dart';

class QariView extends StatefulWidget {
  const QariView({super.key});

  @override
  State<QariView> createState() => _QariViewState();
}

class _QariViewState extends State<QariView> {
  final ApiService _apiService = ApiService();
  String _searchText = '';
  List<Qari> _qariList = [];
  List<Qari> _filteredQariList = [];

  @override
  void initState() {
    super.initState();
    _fetchQariList();
  }

  void _fetchQariList() async {
    try {
      List<Qari> qariList = await _apiService.fetchQariList();
      setState(() {
        _qariList = qariList;
        _filteredQariList = qariList;
      });
    } catch (error) {
      // Handle error
    }
  }

  void _filterQariList(String searchText) {
    setState(() {
      _filteredQariList = _qariList
          .where((qari) => qari.name!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Qari\'s',
            style: titleGreenStyle(),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: const AssetImage(
                "assets/icons/quran.png",
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Qari',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) {
                    _searchText = value;
                    _filterQariList(_searchText);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 0.0,
                      blurRadius: 1,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: _filteredQariList.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _filteredQariList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return QariCustomTile(
                              qari: _filteredQariList[index], ontap: () {});
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
