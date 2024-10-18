import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
    child: Drawer(  
      child: ListView( 
        children: [
          DrawerHeader(
            child: CircleAvatar()),
            ListTile(),
        ],
      ),
    ),);
  }
}