
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Model/ShopPageModel.dart';

class ShopNavigatorPage extends StatelessWidget {
  
   ShopNavigatorPage({Key key,this.naviList}) : super(key:key);
  final List<ImageUrl> naviList;

  void _itemClicked(){

    print('item clicked');
  }

  Widget _gridItemWidget(BuildContext context,ImageUrl data){
    var imgUrl =  data.imgId;
    return InkWell(
      onTap: _itemClicked,
      child: Container(
        child: Image.network(
            imgUrl,
            fit: BoxFit.fitHeight,
          ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      // height: 100,
      height: 86.0,
      // width: size.width,
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 5,
        children: naviList.map((item)=>_gridItemWidget(context,item)).toList(),
        // controller: new ScrollController(),
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(0),
      )
    );
  }
  // ShopNavigatorPage({Key key,this.naviList}) : super(key:key);
  // final List naviList;

  // void _itemClicked(){

  //   print('item clicked');
  // }

  // Widget _gridItemWidget(BuildContext context,data){
  //   var imgUrl = data['img_id'];
  //   return InkWell(
  //     onTap: _itemClicked,
  //     child: Container(
  //       child: Image.network(
  //           imgUrl,
  //           fit: BoxFit.fitHeight,
  //         ),
  //     )
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   // final size = MediaQuery.of(context).size;
  //   return Container(
  //     // height: 100,
  //     height: 86.0,
  //     // width: size.width,
  //     color: Colors.white,
  //     child: GridView.count(
  //       crossAxisCount: 5,
  //       children: naviList.map((item)=>_gridItemWidget(context,item)).toList(),
  //       controller: new ScrollController(),
  //       padding: EdgeInsets.all(0),
  //     )
  //   );
  // }
}