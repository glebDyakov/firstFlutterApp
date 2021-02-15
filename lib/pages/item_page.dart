import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  // This widget is the root of your application.
  final String productId
  const ItemCard({Key key, this.cartData, this.index}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PrductDataProvider>(context).getElementById(productId);
    return Scaffold(
      appBar:AppBar(
        title:Text(data.title, GoogleFonts.marmelad(),),

      ),
      body:Container(
        child:ListView(
          children: <Widget>[
            Hero(
              tag:data.imgUrl,
              child:Container(
                height:300,
                height:double.infinity,
                decoration:BoxDecoration(
                  image:ImageDecoration(
                      image:NetworkImage(data.imgUrl),
                      fit:BoxFit.cover
                  ),
                ),

              ),

            ),
            Card(
              elevation:5.0,
              margin:const EdgeInsets.symmetric(horizontal:35.0, vertical:),
              child:Column(
                children:<Widget>[
                  Text(data.title,style:TextStyle(fontSize:26.0),),
                  Divider(),
                  Row(
                    chldren:<Widget>[
                      Text('Цена: ', style:TextStyle(fontSize:24.0),),
                      Text('${data.price}', style:TextStyle(fontSize:24.0),),
                    ]
                  ),
                  Divider(),
                  Text(data.description)
                  SizedBox(
                    height:20.0,
                  ),
                  Provider.of<CartDataProvider>(context).cartItems.containsKey(productId) ? Column(
                    children:<Widget>[
                      MaterialButton(
                        color:Color(0xFFCCFF90),
                        child:Text("перейти в корзину"),
                          onPressed(){
                            Navigator.of(context).push(MaterialPageRoute(
                            builder:(context) => CartPage(),
                          ));
                          }
                      ),
                      Text(
                        'Товар уже добален в корзину',
                        style:TextStyle(
                          fontSize:12.0,
                          color:Color.blueGrey
                        )
                      )
                    ]
                  )
                      : MaterialBuutton(
                    color:Theme.of(context).primaryColor,
                    child:Text('добавить товар в корзину'),
                    onPressed:(){
                      Provider.of<CartDataProvider>(context, listen:false)
                          .addItem(
                        productId:product.id,
                        price:product.price,
                        title:product.title,
                        imgUrl:product.imgUrl,
                      );
                    }

                  )

                ]
              ),
            )
          ],
        ),
      ),
    );
    }
  }
