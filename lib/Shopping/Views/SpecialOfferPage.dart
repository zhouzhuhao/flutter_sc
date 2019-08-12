
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/ShopPageModel.dart';

class SpecialOfferPage extends StatelessWidget {
  // const SpecialOfferPage({Key key}) : super(key: key);

  final Data resData;
  SpecialOfferPage({Key key,this.resData}) : super(key:key);
//  Mark: 秒杀样式页面开发ing

  // 外层是listView
  // 内层 item 是

  Widget _leftImg(String imgUrl){
    //  可以设计占位图片
    // Widget imgWidget = Image.network(imgUrl);
    return Container(
        padding: EdgeInsets.all(5),
        width: 105,
        child: Image.network(imgUrl,width: 105,)
      );
  }

  Widget _rightWidget(GoodsList data){

    String title = '${data.goodsName}';
    String money = 'Y${data.spikePrice}';
    String marketMoney = 'Y${data.goodsPrice}';
    String btnTitle = '即将开始';
    Color btnBgColor = Colors.red;
    double cornerRadius = 2.0;

    Widget tx = Text(
      title,maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    // 金钱
    Widget moneyWidget = Column(
      children: <Widget>[
        Text(
          money,
            style: TextStyle(
            color: Colors.black
          ),
        ),
        Text(
          marketMoney,
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.black
          ),
        ),
      ],
    );


    Widget second = Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: moneyWidget,
          ),
          Expanded(
            child: Container(
              child: Text(btnTitle),
              color: Colors.red,
            ),
          )
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            child: tx,
            width: 200,  // 暂时写死200
          ),
          // moneyWidget
        ],
      ),
    );
  }

  Widget _innerItem(BuildContext context,GoodsList data){
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        print('mx clicked');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
        width: size.width - 90,
        child: Row(
         children: <Widget>[
          _leftImg(data.photo),
          _rightWidget(data)
        ],
      ),
      ),
    );
  }

  Widget _mxItem(BuildContext context,GoodsList data) {

    final size = MediaQuery.of(context).size;
    print('dv width = ${size.width}');
    List<BoxShadow> bx = [
      BoxShadow(color: Color(0x99FFFF00), offset: Offset(5.0, 5.0),    blurRadius: 10.0, spreadRadius: 2.0),
       BoxShadow(color: Color(0x9900FF00), offset: Offset(1.0, 1.0)), BoxShadow(color: Color(0xFF0000FF))
     ];
    return Container(
      width: size.width - 90,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        border: new Border.all(color: Color(0xFFFF0000), width: 0.5), // 边色与边宽度
        boxShadow: bx,
      ),
      child: _innerItem(context, data)
      // _innerItem(context, data)
    );

  }

  Widget _innerListView(BuildContext context){
    return Expanded(
      // height: 156,
      child: ListView.builder(
      padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
      scrollDirection: Axis.horizontal,
      itemCount: this.resData.spike.goodsList.length,
      itemBuilder: (context,index){
        GoodsList temp = this.resData.spike.goodsList.elementAt(index);
        return _mxItem(context, temp);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // final size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          SpecialOfferTitlePage(spData: resData.spike,),
          _innerListView(context),
        ],
      )
    );
  }

}


class SpecialOfferTitlePage extends StatefulWidget {
  SpecialOfferTitlePage({Key key,this.spData}) : super(key:key);
  final Spike spData;
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
                margin: EdgeInsets.only(right: 13),
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



