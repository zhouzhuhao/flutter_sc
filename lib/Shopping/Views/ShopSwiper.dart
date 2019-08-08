
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ShopSwiper extends StatelessWidget {
  // const ShopSwiper({Key key}) : super(key: key);
  final List swiperDataList;
  ShopSwiper({Key key,this.swiperDataList}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (context,index){
          var res = swiperDataList[index];
          return Image.network(res,fit: BoxFit.fill,);
        },
        autoplay: true,
        pagination: new SwiperPagination(),
      ),
    );
  }
}