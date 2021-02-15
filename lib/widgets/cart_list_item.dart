import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  // This widget is the root of your application.
  const ItemCard({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
        itemCount:cartData.cartItemsCount,
        itemBuilder:(context, index){
          return Dismissible(
            key:ValueKey(cartData.cartItems.keys.toList()[index]),
            background:Container(
              child:Icon(
                Icons.delete,
                color:Colors.redAccent,
                size:30.0,
              ),
                alignment:Alignment.centerRight,
              margin:const EdgeInsets.symmetric(horizontal:15,vertical:4),
              padding:const EdgeInsets.only(right:10),

            ),
            direction:DismissDirection.endToStart,
            onDismissed:(direction) => Provider.of<CarDataProvider>(context, listen:false).deleteItem(cartData.cartItems.keys.toList()[index]),
            child:CarItem(carData,item),
            child:null
          )
        },
      ),
    );
  }
}
