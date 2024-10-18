import 'package:flutter/material.dart';
import 'package:teatot/models/myproducts.dart';
import 'package:teatot/widgets/productdisplay.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products=[
    Product(image: 'assets/anotherone.png', title: 'pizza', description: 'this is the description', price: 190),
    Product(image: 'assets/pizza.jpg',title:'pizza',description: 'this is the pizza description',price: 150),
    Product(image: 'assets/earbuds.jpg',title: 'earbuds',description: 'earbuds descripiont',price: 124),
    Product(image: 'assets/anotherone.png', title: 'pizza', description: 'this is the description', price: 190),
    Product(image: 'assets/pizza.jpg',title:'pizza',description: 'this is the pizza description',price: 150),
    Product(image: 'assets/earbuds.jpg',title: 'earbuds',description: 'earbuds descripiont',price: 124),
    Product(image: 'assets/anotherone.png', title: 'pizza', description: 'this is the description', price: 190),
    Product(image: 'assets/pizza.jpg',title:'pizza',description: 'this is the pizza description',price: 150),
    Product(image: 'assets/earbuds.jpg',title: 'earbuds',description: 'earbuds descripiont',price: 124),
    Product(image: 'assets/anotherone.png', title: 'pizza', description: 'this is the description', price: 190),
    Product(image: 'assets/pizza.jpg',title:'pizza',description: 'this is the pizza description',price: 150),
    Product(image: 'assets/earbuds.jpg',title: 'earbuds',description: 'earbuds descripiont',price: 124),


  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 15,),
            appbar(),
            SizedBox(height: 10,),
            mySearchBar(),
            SizedBox(height: 12,),
            productsinColumn(),
          ],
        ),
      ),),
    );
  }

  Widget appbar(){
    return Row(  
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu,color: Colors.black,size: 45,))
      ],
    );
  }
  Widget mySearchBar(){
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black,width: 2)
      ),
      child:Row(  
        children: [
          Padding(
            padding: EdgeInsets.only(left: 13),
            child: Icon(Icons.search,size: 35,color: Colors.black,)),
          Flexible(
            
            child:TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'enter an item to search',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                )
              ),
            )
          )
        ],
      )
    );
  }
  Widget productsinColumn(){
    return  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        
        child: Row(
          children: products.map((e){
            return MyProductDisplay(product: e);
          }
          ).toList(),
        ),
    );
  }
}