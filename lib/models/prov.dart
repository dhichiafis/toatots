import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:teatot/models/mycartItem.dart';
import 'package:provider/provider.dart';

class CartProvider with ChangeNotifier{
  double get getTotalPrice =>getPrices();

  List <CartItem> cartItems=[];

  List <CartItem> get getAllItems=>cartItems;

  void addItemToCart(CartItem e){
    notifyListeners();
    cartItems.add(e);
    print('item successfully added');
  }
  void incrementQuantity(CartItem e){
    notifyListeners();
    e.quantity=e.quantity+1;
  }
  void removeItemFromCart(CartItem e){
    cartItems.remove(e);
   notifyListeners();
  }

  void clearCart(){
    notifyListeners();
    cartItems.clear();
  }

  double getPrices(){
    double totalPrices=0;
    for (var item in getAllItems){
      var sum=item.price*item.quantity;
      totalPrices=totalPrices+sum;
    }
    return totalPrices;
  }
}