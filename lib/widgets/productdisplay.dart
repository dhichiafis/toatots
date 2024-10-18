import 'package:flutter/material.dart';
import 'package:teatot/models/myproducts.dart';

class MyProductDisplay extends StatelessWidget {
  MyProductDisplay({super.key,required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed('/details',arguments: {
          'image':product.image,
          'title':product.title,
          'description':product.description,
          'price':product.price
        });
      },
      child: Material(
        elevation: 6,
        child: Container(
          margin: EdgeInsets.all(13),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            
            
          ),
          child: Row(  
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.4,
                height: 150,
                child: Image.asset(product.image,fit: BoxFit.contain,),
                ),
                SizedBox(width: 12,),
              Column( 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(product.title,style:TextStyle(fontSize: 35,color:Colors.black)),
                  Text(product.description,style: TextStyle(fontSize: 18,color:Colors.black),),
                  Text(product.price.toString(),style: TextStyle(fontSize: 35,color: Colors.black),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}