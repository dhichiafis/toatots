import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:teatot/pages/mycartpage.dart';
import 'package:teatot/pages/mydrawer.dart';
import 'package:teatot/pages/myhomepage.dart';
import 'package:teatot/pages/mytrackorderpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  int selectedIndex=0;
  List <Widget> pages=[
    MyHomePage(),
    MyCartPage(),
    MyOrderTrackerPage(),
  ];
  void onItemPressed(int index){
    setState(() {
      selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      drawer: MyDrawer(),
      body: pages[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onItemPressed,
        index: selectedIndex,
        color:Colors.white,
        animationCurve: Curves.easeIn,
       animationDuration: Duration(milliseconds:400),
        backgroundColor: Colors.black,
        items:[
          IconButton(onPressed: (){
            setState(() {
              selectedIndex=0;
            });
          }, icon: Icon(Icons.home),tooltip: 'home',),
          IconButton(onPressed: (){
            setState(() {
              selectedIndex=1;
            });
          }, icon: Icon(Icons.shop),tooltip: 'cart',),
          IconButton(onPressed: (){
            setState(() {
              selectedIndex=2;
            });
          }, icon: Icon(Icons.portable_wifi_off),tooltip: 'profile',)
        ]
      )
    );
  }
}