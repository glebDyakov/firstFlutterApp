import 'dart:collection';

import 'package:flutter'
class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final num price;
  final String imageUrl;
  final color;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.color
  });
}
class ProductDataProvider with ChangeNotifier{
  List<Product> _items = [
    Product(
        id:"a",
        title:"a",
        description:"a",
        price:1,
        imageUrl:"a",
        color:"a"
    ),
    Product(
        id:"a",
        title:"a",
        description:"a",
        price:1,
        imageUrl:"a",
        color:"a"
    ),
    Product(
        id:"a",
        title:"a",
        description:"a",
        price:1,
        imageUrl:"a",
        color:"a"
    ),
    Product(
        id:"a",
        title:"a",
        description:"a",
        price:1,
        imageUrl:"a",
        color:"a"
    ),
    Product(
        id:"a",
        title:"a",
        description:"a",
        price:1,
        imageUrl:"a",
        color:"a"
    ),
  ];
      UnmodifiableListView<Product> get items => UnmodifiableListView(_items);
      Product getElementById(String id) => _items.singleWhere((value) => value.id == id)
}