import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  const HomePage({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);
    // return Scaffold(
    //   body: Container(
    //     child:ListView(
    //       children:<Widget>
    //     )
    //   ),
    //
    // );
    return Scaffold(
      backgroundColor:Colors.amberAccent,
      body: SafeArea(
        child:Container(
          height:MediaQuery.of(context).size.height - 85,
          decoration:BoxDecoration(
            color:Colors.white,
            borderRadius:BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            )
          ),
            child:ListView(
              children:<Widget>[
                Container(
                  child:ListTitle(
                    title: Text(
                      "Освежающие напитки",
                      style: TextStyle(fontSize:24, fontWeight: FontWeight.bold),

                    ),
                    subtitle: Text(
                        "Больше чем 100 видов напитков",
                      style: TextStyle(fontSize:16),
                    ),
                    trailing:Icon(Icons.panorama_horizontal),

                  )
                ),
                Container(
                  // child:Text('Горизонтальный список карточек'),
                  height: 390,
                  padding:const Edgensets.all(5.0),
                  child: ListView(
                    scrollDirection:Axis.horizontal,
                    itemCount:productData.items.length,
                    itemBuilder: (context, int index) =>
                          ChangeNotifierProvider.value(
                            value: productData.items[index],
                            child: ItemCard
                          )
                  )
                ),
                Padding(
                  padding:const EdgeInsets.all(10.0),
                  child:Text("каталог коктейлей")
                ),
                // Container(
                //   child:Text('список каталогов'),
                // ),
                ...productData.items.map((value){
                  return CatalogListTitle(imgUrl:value.imgUrl);
                }).toList(),
              ],
              padding:const EdgeInsets.all(10.0),

            )
        )
      ),
      bottomNabigationBar:BottomBar(),

    );
  }
}
