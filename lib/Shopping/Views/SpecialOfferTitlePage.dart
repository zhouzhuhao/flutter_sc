
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SpecialOfferTitlePage extends StatefulWidget {
  // SpecialOfferTitlePage({Key key}) : super(key: key);
  SpecialOfferTitlePage({Key key,this.spData}) : super(key:key);
  final spData;
  _SpecialOfferTitlePageState createState() => _SpecialOfferTitlePageState();
}

class _SpecialOfferTitlePageState extends State<SpecialOfferTitlePage> {
  var timeTitle = '08月08日';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: Colors.white,
      ),
      // alignment: Alignment.bottomLeft,
      child:  GestureDetector(
        onTap: (){},
        
        child: Row(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Container(
                // alignment: Alignment.bottomLeft,
                child:Text(
                '限时秒杀',
                textAlign: TextAlign.left,
                style: TextStyle(
                 fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              // alignment: Alignment.bottomLeft,
              child: Text(
                timeTitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffff1832),
                  // Color(0xFF1832),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Icon(CupertinoIcons.play_arrow),
              ),
            )
          ],
        ),
      ),
    );
  }
}