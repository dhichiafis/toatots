import 'package:flutter/material.dart';

class CartItem{
   String image;
String title;
String description;
   double price;
 int quantity;

  CartItem({required this.image,
  required this.title,required this.description,
  required this.price,required this.quantity});


  CartItem.fromJson(Map<String,dynamic>json):
    image=json['image'],
    title=json['title'],
    description=json['description'],
    price=json['price'],
    quantity=json['quantity'];

  Map<String,dynamic>toJson(){
    return ({
      'image':image,
      'title':title,
      'description':description,
      'price':price,
      'quantity':quantity
    });
  }

}