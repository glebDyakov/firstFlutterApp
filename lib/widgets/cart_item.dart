import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  // This widget is the root of your application.
  final cartData;
  final index;
  const ItemCard({Key key, this.cartData, this.index}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      ListTile(

        leading:InkWell(
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder:(context) =>
                ItemPage(productId:cartData.cartItems.keys.toList()[index])),
            );
          },
          child:Container(
          width:50,
          height:50,
          decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(15),
            image:DecorationImage(image:NetworkImage(cardData.cartItems.values.toList()[index].imgUrl)),
            fit:BoxFit.cover,
            
          ),
        ),
        title:Text(NetworkImage(cardData.cartItems.values.toList()[index].title),
        subtitle:Text('Цена: ${cardData.cartItems.values.toList()[index].title}'),
        trailing:Row(
          mainAxisSize: MainAxisSize.min,
            children:<Widget>[
            IconButton(
              icon:Icon(Icons.remove_circle_outline),
              onPressed:(){
                Provider.of<CardDataProvider>(context, listen:false).updateItemAndOne(cartDatacartItems.keys.toList()[index]);
              },
              Text('${cardData.cartItems.values..toList()[index].number'),

            ),
          IconButton(
              icon:Icon(Icons.add_circle_outline),
              onPressed:(){
                Provider.of<CardDataProvider>(context, listen:false).updateItemsAndOne(cartDatacartItems.keys.toList()[index]);
              },
          )
              ]
          ]
        ),

      ),
      );
    );
  }
}
