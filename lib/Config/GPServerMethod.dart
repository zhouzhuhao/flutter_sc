import 'dart:async';
import 'package:dio/dio.dart';
import 'GPServerApi.dart';

Future accquireShoppingPage() async {

  String reqUrl = shoppingPageUrl();
  try{
    Response rsp = await Dio().post(reqUrl);
    if(rsp.statusCode==200){
      print('shop page res = ${rsp.data.toString()}');
      return rsp;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e){
    return print('ERROR: =========== $e');
  }

}