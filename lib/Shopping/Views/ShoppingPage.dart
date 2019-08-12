
import 'dart:convert';
import 'package:flutter/material.dart';   // android 样式风格
import 'package:flutter/cupertino.dart';  // ios 样式风格
import 'package:flutter_gp/Shopping/Views/ShopNavigatorPage.dart';
import 'package:flutter_gp/Shopping/Views/SpecialOfferPage.dart';
import '../../Config/GPServerMethod.dart';

//  Model
import '../Model/ShopPageModel.dart';

//  轮播图
import 'ShopSwiper.dart';
// import 'SpecialOfferTitlePage.dart';

//  活动图
import 'ShopActivityPage.dart';

class ShoppingPage extends StatefulWidget {
  ShoppingPage({Key key}) : super(key: key);
  
  _ShoppingPageState createState() => _ShoppingPageState();

}

class _ShoppingPageState extends State<ShoppingPage> with AutomaticKeepAliveClientMixin{


  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  
  List<Widget> _buildShopPage(BuildContext context,decodeData){

    List<Widget> wdList = <Widget>[];
    try{

      ShopPageModel model = ShopPageModel.fromJson(decodeData);
      print('message = ${model.message} code = ${model.code}');

      for (Data temp in model.data) {
        
        if (1 == temp.type){
          // 轮播页面
          List<ImageUrl> imgUrlList =  temp.imageUrl;
          if (imgUrlList.length > 0){
            wdList.add(ShopSwiper(swiperDataList: imgUrlList,));
          }
        }else if (0==temp.type){
          wdList.add(ShopActivityPage(activityData: temp,));
        }
      }
      
      return wdList;

    }catch (e){

      print("shop page error = $e");
      Widget error = Center(
        child: Text('error $e'),
      );
      wdList.add(error);
      return wdList;

    }
  

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('商城首页'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
        future: accquireShoppingPage(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            // 有数据 -- 先撸，后期转模型
            var decodeData = json.decode(snapshot.data.toString());
            print('shopping origin data = $decodeData');
            return Column(
              children: _buildShopPage(context, decodeData)
            );
          }else{
            return Center(
              child: Text('加载中...'),
            );
          }
        },
      ),
    ),
  );
  }




} 

