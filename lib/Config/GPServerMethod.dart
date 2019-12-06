import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'GPServerApi.dart';
// import 'package:dio_log/dio_log.dart';
import 'GPLog.dart';

class DioManager {
  // 工厂模式
  factory DioManager() =>_getInstance();
  static DioManager get instance => _getInstance();
  static DioManager _instance;
  Dio shareDio;
  DioManager._internal() {
    // 初始化
    shareDio = Dio();
    shareDio.interceptors.add(DioLogInterceptor());
  }
  static DioManager _getInstance() {
    if (_instance == null) {
      _instance = DioManager._internal();
      // new DioManager._internal();
    }
    return _instance;
  }
}

Future accquireShoppingPage() async {
  // dio.interceptors.add(DioLogInterceptor());
  // Dio().interceptors
  String reqUrl = shoppingPageUrl();
  print('requrl = $reqUrl');
  try{
    Response rsp = await DioManager.instance.shareDio.post(reqUrl);
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