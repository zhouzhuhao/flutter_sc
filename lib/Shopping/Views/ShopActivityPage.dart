
//  活动导航页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/ShopPageModel.dart';



class ShopActivityPage extends StatelessWidget {
  // const ShopActivityPage({Key key}) : super(key: key);
  final Data activityData;
  ShopActivityPage({Key key,this.activityData}) : super(key: key);


  Widget _cellInkWell(ImageUrl imgVal,double width){

    double height = imgVal.imgHeight /2.0;
    
    return InkWell(
        onTap: (){
          print('cell clicked ${imgVal.toJson()}');
        },
        child: Image.network(
        imgVal.imgId,
        height: height,
        width: width,
        fit: BoxFit.fill,
      )
    );
  } 

  Widget _wrapCell(List<ImageUrl> imgList,BuildContext context){
    double cellWidth = 0.0;
    if (imgList.length > 0){
      cellWidth = MediaQuery.of(context).size.width / imgList.length;
    }
    List<Widget> listWidget = imgList.map((val){
      return _cellInkWell(val,cellWidth);
    }).toList();
    // int count = listWidget.length;
    double width = MediaQuery.of(context).size.width;
    if (listWidget.length >= 2) {
      return Container(
        width: width,
        child: Wrap(
          children: listWidget,
       ),
      );
    }

    if (1 == listWidget.length) {
        return Container(
        width: width,
        child: Wrap(
        spacing:0.0,
        children: listWidget,
       ),
      );
    }

    return null;

  }

  Widget _activityImgWidget(BuildContext context){


    try{
      List<ImageUrl> imgList = activityData.imageUrl;
      return _wrapCell(imgList,context);
    }catch (e){
      print('build activity banner error = $e');
      return null;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    Widget resWidget = _activityImgWidget(context);
    if (null == resWidget){
      return null;
    } 
    double height = activityData.imageUrl.elementAt(0).imgHeight / 2.0;
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: height,
      child: resWidget,
    );
  }

}