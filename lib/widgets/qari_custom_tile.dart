import 'package:flutter/material.dart';
import 'package:sourates/model/qari.dart';

class QariCustomTile extends StatefulWidget {
  const QariCustomTile({super.key, required this.qari, required this.ontap});
  final Qari qari;
  final VoidCallback ontap;

  @override
  State<QariCustomTile> createState() => _QariCustomTileState();
}

class _QariCustomTileState extends State<QariCustomTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
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
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.qari.name!, style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),),
            ],
          ),
          Spacer(),
            ],
          ),
        ],
      ),
    ),
    );

  }
}
