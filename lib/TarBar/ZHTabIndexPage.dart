
//  killall -9 dart 强行关掉dart执行
//  tab
import 'package:dio_log/overlay_draggable_button.dart';
import 'package:flutter/material.dart';   // android 样式风格
import 'package:flutter/cupertino.dart';  // ios 样式风格
import 'package:flutter/foundation.dart';

//  page
import '../Shopping/Views/ShoppingPage.dart';
import '../JingXuan/Views/JxPage.dart';



class ZHTabIndexPage extends StatefulWidget {
  ZHTabIndexPage({Key key}) : super(key: key);

  _ZHTabIndexPageState createState() => _ZHTabIndexPageState();
}

class _ZHTabIndexPageState extends State<ZHTabIndexPage> {


  
  @override
  void initState() {
   
    currentPage = tabBodies[currentIndex];
    showDebugBtn(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


 // tabbar item 
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('商城')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.search),
      title:Text('精选')
    ),
  ];
  // 当前页面index
  int currentIndex = 0;
  // 当前page
  var currentPage;

  final List<Widget> tabBodies = [
    ShoppingPage(),
    JxPage()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
  
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies
      )
    );
  }
}