import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  // This widget is the root of your application.
  final cartData=.of<CartDataProvider>(context);
  const ItemCard({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Корзинка счастья')
      ),
      body:cartData.cartItems.isEmpty()
        ? Card(
        elevation:5.0,
        margin:const EdgeInsets.all(30.0),
        child:Container(
          height:100,
          width:double.infinity,
          textAlign: Alignment.center,
          child:Text('Козина пустая ;(',),

        )
      )
          : Column(
        children:<Widget>[
          Divider(),
          Row(
              mainAxisAlignment.spaceEvenly,
              children:<Widget>[
                Text(
                  'Стоимость: ' + cartData.totalAmount.toStringAsFixed(2),
                  style:TextStyle(
                    fontSize:20
                  ),
                  MaterialButton(
                    onPressed:(){
                      cartData.clear();
                    },
                    color:Theme.of(context).primaryColor,
                      child:Text(
                      'Купить'
                      )
                  ),

                )
              ]
          ),
          Divider(),
          Expanded(CartItemList(cartData:cartData)),

        ]
      )
    );
  }
}
