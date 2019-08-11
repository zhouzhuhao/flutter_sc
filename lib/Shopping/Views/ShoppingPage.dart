
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

    // model
    ShopPageModel model = ShopPageModel.fromJson(decodeData);
    print('message = ${model.message} code = ${model.code}');

    List<Widget> wdList = <Widget>[];

    // 轮播首页
    Data data0 = model.data.elementAt(0);
    List<ImageUrl> imgUrlList =  data0.imageUrl;
    if (imgUrlList.length > 0){
       wdList.add(ShopSwiper(swiperDataList: imgUrlList,));
    }

    // 导航标签
    Data navData = model.data.elementAt(1);

    List<ImageUrl> navList = navData.imageUrl;
    if (navList.length > 0) wdList.add(ShopNavigatorPage(naviList: navList,));

    // 秒杀
    Data mxData = model.data.elementAt(2);
    wdList.add(SpecialOfferPage(resData: mxData,));

    //   // 数据
    // List data = decodeData['data'] as List;
    // print('shopping swiper image data = $data');
    // // 必要的时候要判断
    // var firstData = data.length>0 ? data[0]:{};
    // List imageUrl = firstData['ImageUrl'];
    // print('image url = $imageUrl');
    // // 轮播图
    // List swiperList = imageUrl.map((val) => val['img_id']).toList();
    // if (swiperList.length>0) wdList.add(ShopSwiper(swiperDataList: swiperList,));
    // print('swiperList = $swiperList');
    // // 导航标签图片 -- 后期有操作
    // var secondData = data.length>2 ? data[1]:{};
    // List navIconList = secondData['ImageUrl'];
    // if (navIconList.length > 0) wdList.add(ShopNavigatorPage(naviList: navIconList,));

    // // 添加 限时秒杀
    // var thirdData = data.length>3 ? data[2] : {};
    // var mxData = thirdData['spike']['spikeDetails'];
    // var res = mxData['beginTime'];
    // List mxGoods = ( thirdData['spike']['goodsList'] as List).cast();
    // if (res != null && mxGoods.length > 0){
    //   wdList.add(SpecialOfferTitlePage(spData: mxData,));
      
    // }
  
    // wdList.add(SpecialOfferTitlePage(spData: null,));

    return wdList;

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('商城首页'),
      ),
      body: FutureBuilder(
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
    );

  }




} 
