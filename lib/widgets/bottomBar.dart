import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  // This widget is the root of your application.
  final cartData=Provider.of<CartDataProvider>(context);
  final cartItems=cartData.cartItems;
  const ItemCard({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color:Colors.transparent,
      child:Container(
        height:60,
        decoration:BoxDecoration(
          color:Colors.amberAccent,

        ),
        child:Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children:<Widget>[
            Container(
              height:50,
              width:MediaQuery.of(context).size.width / 2 + 50,
              child:ListView.builder(
                  scrollDirection:Axis.Horizontal,
                  itemCount:cartItems.length,
                  itemBuilder:(context, index) => Hero(
                    tag:cartItems.values.toList()[index].imgUrl,
                    child:GestureDetector(
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) =>
                            ItemPage(productId:product.id)),
                        );
                      },
                      child: Stack(
                        alignment:Alignment.center
                          children:<Widget>[
                              Container(
                        width:35,
                        height:35,
                        margin:const EdgeInsets.all(5.0),
                        decoration:BoxDecoration(
                          shape:BoxShape.circle,
                          boxShadow:[
                            BoxShadow(
                              color:Color.black54,
                              blurRadius:4.0,
                              spreadRadius:5.0,
                              offset: Offset(-2,-2),

                            )
                          ],
                          image:DecorationImage(
                            image:NetworkImage(cartItems.values.toList()[index].imgUrl0,
                            fit:BoxFit.cover,

                            )
                          )
                        )
                      ),
                        Positioned(
                            child:Container(
                              padding:EdgeInsets.all(2.0),
                              decoration:BoxDecoration(
                                borderRadius:BorderRadius.circular(10.0),
                                color:Colors.black,
                              ),
                                constraints:BoxConstraints(
                                    minWidth:16,
                                    minHeight:16,
                                ),
                                child:Text(
                                  "${cartItems.values.toList()[index].number}",
                                  textAlign:TextAlign.center,
                                  style:TextStyle(
                                    fontSize:11,
                                    color:Colors.white
                                  )
                                )
                            )
                        )
                          ]
                      )
                    )
                  ),


              ),
            ),
        Container(
          height:50.0,
            width:MediaQuery.of(context).size.width / 2 - 50,
            child:Row(
            children:<Widget>[
              mainAxisAlignment:MainAxisAlignment.end,
              Text(cardData.totalAmount.toStringAsFixed(2)),
              IconButton(
                icon:Icon(Icons.shopping_basket,color:Color(0xFF676E79)),
                onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder:(context) => CartPage(),

                  ));
                },
              ),
            ],
          )
        )
          ]
        ) ,

      ),
    )
  }
}
