
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../Model/ShopPageModel.dart';

class ShopSwiper extends StatelessWidget {

  final List<ImageUrl> swiperDataList;
  ShopSwiper({Key key,this.swiperDataList}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    ImageUrl first = swiperDataList.elementAt(0);
    double height = first.imgHeight / 2.0;

    return Container(
      height: height>0?height:270,
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (context,index){
          ImageUrl res = swiperDataList[index];
          return Image.network(res.imgId,fit: BoxFit.fill,);
        },
        autoplay: true,
        pagination: new SwiperPagination(),
      ),
    );
  }

  // const ShopSwiper({Key key}) : super(key: key);
  // final List swiperDataList;
  // ShopSwiper({Key key,this.swiperDataList}) : super(key:key);

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: 270,
  //     child: Swiper(
  //       itemCount: swiperDataList.length,
  //       itemBuilder: (context,index){
  //         var res = swiperDataList[index];
  //         return Image.network(res,fit: BoxFit.fill,);
  //       },
  //       autoplay: true,
  //       pagination: new SwiperPagination(),
  //     ),
  //   );
  // }
}