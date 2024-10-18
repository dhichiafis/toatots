import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teatot/models/prov.dart';
import 'package:teatot/pages/mybotnav.dart';
import 'package:teatot/pages/mycartpage.dart';
import 'package:teatot/pages/mydetailpage.dart';
import 'package:teatot/pages/mytrackorderpage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<CartProvider>(
      create:(_)=>CartProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override  
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/':(context)=>MyBottomNav(),
        '/details':(context)=>MyDetailsPage(),
        '/cart':(context)=>MyCartPage()
        ,'/track':(context)=>MyOrderTrackerPage()
      }
    );
  }
}