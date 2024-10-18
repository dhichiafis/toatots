import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:teatot/models/mycartItem.dart';
import 'package:teatot/models/prov.dart';
class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cart=Provider.of<CartProvider>(context).getAllItems;
    //var b=Provider.of<CartProvider>(context).getAllItems;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Column(
                  children: cart.map((e){
                    return makeCartItem(e);
                  }).toList(),
                ),
                Container( 
                  width: MediaQuery.of(context).size.width,
                  height: 150, 
                  decoration: BoxDecoration(color:Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  ),
                  child:Column(   
                    children: [
                      SizedBox(height: 5,),
                      Text('The total price is ',style: TextStyle(fontSize:30,color:Colors.black),),
                      SizedBox(height: 5,),
                      Text(Provider.of<CartProvider>(context).getTotalPrice.toString(),style:TextStyle(fontSize:30,
                      fontWeight: FontWeight.bold,
                      color:Colors.black)),
                      
                      Row(  
                        children: [
                          ElevatedButton(onPressed: (){
                            Provider.of<CartProvider>(context,listen: false).clearCart();
                          }, child: Text('clear cart')),
                          ElevatedButton(
                        style: ElevatedButton.styleFrom(  
                          backgroundColor: Colors.black
                        ),
                        onPressed: (){
                          //Navigator.pushNamed(context, '/');
                          checkoutDialog(context);
                      }, child: Text('Checkout',style:TextStyle(color:Colors.white,fontSize:30)))
                    
                        ],
                      )
                      ],
                  )),
              ]
            ),
          ),
        ),
      )
    );
  }
  Future<dynamic> checkoutDialog(context){
    return showDialog(context:context,builder:(BuildContext context){
      return Dialog(
        child:Container(
          height: 250,
          padding: EdgeInsets.all(12),
          child: Column(  
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Checkout'),
              SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5,right: 5),
                  child: TextField( 
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'enter your phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text('Amount :${Provider.of<CartProvider>(context).getTotalPrice.toString()}'
              ,style: TextStyle(fontSize:30),),
              Row(  
                children: [
                  Flexible(
                      child: ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: Text('cancel',style: TextStyle(fontSize: 25),)),
                    
                  ),

                Flexible(
                    child: ElevatedButton(onPressed: (){
                    //Provider.of<CartProvider>(context,listen: false).clearCart();
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/track');
                                  }, child: Text('Send',style: TextStyle(fontSize: 25),)),
                  
                )
                ],
              )
            ],
          ),
        )
      );
    });
  }

  Container makeCartItem(e){
    return Container(
      margin: EdgeInsets.only(top: 6,bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25)
      ),
      height: 100,
      child: Row(  
        children: [
          Image.asset(e.image,width: 150,fit: BoxFit.cover,),
          SizedBox(width: 8,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(e.title,style: TextStyle(fontSize: 25),),
              Text(e.price.toString(),style: TextStyle(fontSize: 25),)
            ],),
          ),
          Column(  
            children: [
              IconButton(onPressed: (){
                Provider.of<CartProvider>(context,listen: false).incrementQuantity(e);
              }, icon: Icon(Icons.add,)),
              Text(e.quantity.toString()),
            ],
          )
        ],
      ),
    );
  }
}