import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teatot/models/mycartItem.dart';
import 'package:teatot/models/prov.dart';

class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage({super.key});

  @override
  State<MyDetailsPage> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final String image=arg['image'];
    final String title=arg['title'];
    final String description=arg['description'];
    final double price=arg['price'];
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.only(left: 20,right: 15),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            header(),
            SizedBox(height: 25,),
            imageItself(image),
            SizedBox(height: 25,),
            myColumn(title, description, price),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black
              ),
              onPressed: (){
               Provider.of<CartProvider>(context,listen: false).addItemToCart(CartItem(image:image,
               title: title,
                description: description, price: price, quantity: 1));
                Navigator.pushNamed(context, '/');
            }, child: Text('add to cart',style: TextStyle(color: Colors.white,fontSize: 35),))
            
          ],
        ),
      )),
    );
  }
  Column myColumn(title,description,price){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize:40,color:Colors.black),),
        SizedBox(height: 5,),
        Text(description,style: TextStyle(fontSize:18,color:Colors.black),),
        SizedBox(height: 5,),
        Text(price.toString(),style: TextStyle(fontSize: 40,color:Colors.black),)
      ],
    );
  }
  Widget header(){
    return Row(
      children: [
        IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,size: 34,color: Colors.black,))
      ],
    );
  }
  Widget imageItself(image){
    return Container(
      height: MediaQuery.of(context).size.height*0.45,
      width: double.infinity,
      child: Image.asset(image,fit: BoxFit.cover,),
    );
  }
}